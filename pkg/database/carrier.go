package database

import "MyLoads/pkg/models"

func (s *Server) GetInfoCarriers() ([]models.CarrierOut, error) {
	var result []models.CarrierOut
	var carrierOut models.CarrierOut
	var carrier models.Carrier
	var bids, nonDubBids, err = s.GetAllBids()
	print(bids)
	if err != nil {
		return nil, err
	}

	//TODO: попытаться сделать одним запросом (агрегаты и так юзаются)

	for _, b := range nonDubBids {
		err = s.Db["AUCTION"].Table("cargo, bid").Select("COUNT(deleted) as deleted_cargo").
			Where("cargo.current_winner_id = bid.ID AND bid.company_id = ? AND deleted = ?", b.CompanyID, true).
			Find(&carrier).Error

		err = s.Db["AUCTION"].Table("cargo, bid").Select("COUNT(deleted) as active_cargoes").
			Where("cargo.current_winner_id = bid.ID AND bid.company_id = ? AND deleted = ?", b.CompanyID, false).
			Find(&carrier).Error

		err = s.Db["AUCTION"].Table("bid").Select("COUNT(company_id) as bidding_for_goods").
			Where("company_id = ?", b.CompanyID).Find(&carrier).Error
		//err := s.Db["AUCTION"].Table("cargo").Select("COUNT(company_id) as created_cargo").
		//	Where("company_id = ?", c.ID).Find(&carrier).Error
		//if err != nil {
		//	return nil, err
		//}
		//err = s.Db["AUCTION"].Table("cargo_item").Select("COUNT(is_deleted) as active_cargoes").
		//	Where("company_id = ? AND is_deleted = ?", c.ID, false).Find(&carrier).Error
		//if err != nil {
		//	return nil, err
		//}
		//err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(cargo_item.selected_carrier_id) as cargo_with_assigned_carrier").
		//	Where("company_id = ?", c.ID).Find(&carrier).Error
		//if err != nil {
		//	return nil, err
		//}
		//err = s.Db["AUCTION"].Table("cargo_item").Select("COUNT(is_deleted) as deleted_cargo").
		//	Where("company_id = ? AND is_deleted = ?", c.ID, true).Find(&carrier).Error
		//if err != nil {
		//	return nil, err
		//}
		//
		////err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(cargo_item.selected_carrier_id) as cargoes_without_a_carrier").
		////	Where("cargo_item.company_id = ? AND cargo_item.selected_carrier_id is null", c.ID).Find(&carrier).Error
		////if err != nil {
		////	return nil, err
		////}
		//carrier.CargoesWithoutACarrier = carrier.CreatedCargo - carrier.CargoWithAssignedCarrier
		//
		//err = s.Db["AUCTION"].Table("cargo_pay_model, cargo_item").Select("AVG(cargo_pay_model.amount) as average_starting_price, "+
		//	"AVG(cargo_pay_model.start_amount) as average_final_freight_price").
		//	Where("cargo_item.company_id = ? AND cargo_item.payment_id = cargo_pay_model.id", c.ID).Find(&carrier).Error
		if err != nil {
			return nil, err
		}

		carrierOut.CarrierInfo = carrier
		carrierOut.CompanyInfo = b
		result = append(result, carrierOut)
	}

	return result, nil
}
