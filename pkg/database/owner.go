package database

import (
	"MyLoads/pkg/models"
)

func (s *Server) GetInfoOwners() ([]models.SHIPPER, error) {
	var result []models.SHIPPER
	var shipper models.SHIPPER
	var owner models.Owner
	var companies, err = s.GetCompanies()

	if err != nil {
		return nil, err
	}

	for _, c := range companies {
		if c.Industry == 1 {


			err := s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(company_id) as created_cargo").
				Where("company_id = ?", c.ID).Find(&owner).Error
			if err != nil {
				return nil, err
			}
			err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(is_deleted) as active_cargoes").
				Where("company_id = ? AND is_deleted = ?", c.ID, false).Find(&owner).Error
			if err != nil {
				return nil, err
			}
			err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(cargo_item.selected_carrier_id) as cargo_with_assigned_carrier").
				Where("company_id = ?", c.ID).Find(&owner).Error
			if err != nil {
				return nil, err
			}
			err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(is_deleted) as deleted_cargo").
				Where("company_id = ? AND is_deleted = ?", c.ID, true).Find(&owner).Error
			if err != nil {
				return nil, err
			}

			
			owner.CargoesWithoutACarrier = owner.CreatedCargo - owner.CargoWithAssignedCarrier

			err = s.Db["MONOLITH"].Table("cargo_pay_model, cargo_item").Select("AVG(cargo_pay_model.amount) as average_starting_price, "+
				"AVG(cargo_pay_model.start_amount) as average_final_freight_price").
				Where("cargo_item.company_id = ? AND cargo_item.payment_id = cargo_pay_model.id", c.ID).Find(&owner).Error
			if err != nil {
				return nil, err
			}


			shipper.InfoOwner = owner
			shipper.CompanyModel = c
			result = append(result, shipper)
		}
	}

	return result, nil
}
