package database

import "MyLoads/pkg/models"

func (s *Server) GetInfoCarriers() ([]models.CarrierOut, error) {
	var result []models.CarrierOut
	var carrierOut models.CarrierOut
	var carrierAVG []models.Carrier
	var carrier models.Carrier
	var bids, nonDubBids, err = s.GetAllBids()
	print(bids)
	if err != nil {
		return nil, err
	}

	for i, b := range nonDubBids {
		var company models.CompanyModel
		err = s.Db["AUCTION"].Table("cargo, bid").Select("COUNT(deleted) as deleted_cargo").
			Where("cargo.current_winner_id = bid.ID AND bid.company_id = ? AND deleted = ?", b.CompanyID, true).
			Find(&carrier).Error

		err = s.Db["AUCTION"].Table("cargo, bid").Select("COUNT(deleted) as active_cargoes").
			Where("cargo.current_winner_id = bid.ID AND bid.company_id = ? AND deleted = ?", b.CompanyID, false).
			Find(&carrier).Error

		err = s.Db["AUCTION"].Table("bid").Select("COUNT(company_id) as bidding_for_goods").
			Where("company_id = ?", b.CompanyID).Find(&carrier).Error

		carrier.Victory = carrier.ActiveCargoes + carrier.DeletedCargo
		carrier.Losses = carrier.BiddingForGoods - carrier.Victory

		if err != nil {
			return nil, err
		}

		s.Db["AUCTION"].Raw("SELECT bid.company_id, bid.\"name\", AVG(bid.amount) as average_starting_price, AVG(cargo_pay_model.amount) as average_final_freight_price FROM bid INNER JOIN cargo ON bid.\"id\" = cargo.current_winner_id AND bid.cargo_id = cargo.\"id\" INNER JOIN cargo_pay_model ON cargo.payment_id = cargo_pay_model.\"id\" GROUP BY bid.company_id, bid.\"name\" ORDER BY bid.company_id").Find(&carrierAVG)
		s.Db["MONOLITH"].Table("company_model").Where("id = ?", b.CompanyID).Find(&company)

		carrier.AverageFinalFreightPrice = carrierAVG[i].AverageFinalFreightPrice
		carrier.AverageStartingPrice = carrierAVG[i].AverageStartingPrice

		carrierOut.CarrierInfo = carrier
		carrierOut.CompanyInfo = company
		result = append(result, carrierOut)
	}

	return result, nil
}
