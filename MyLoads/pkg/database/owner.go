package database

import (
	"MyLoads/pkg/models"
)

func (s *Server) GetInfoOwnerByCompanyId(id int64) (*models.Owner, error) {
	var result models.Owner

	err := s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(company_id) as created_cargo").
		Where("company_id = ?", id).Find(&result).Error
	if err != nil {
		return nil, err
	}
	err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(is_deleted) as active_cargoes").
		Where("company_id = ? AND is_deleted = ?", id, false).Find(&result).Error
	if err != nil {
		return nil, err
	}
	err = s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(selected_carrier_id) as cargo_with_assigned_carrier").
		Where("company_id = ?", id).Find(&result).Error
	if err != nil {
		return nil, err
	}

	result.DeletedCargo = result.CreatedCargo - result.ActiveCargoes
	result.CargoesWithoutACarrier = result.CreatedCargo - result.CargoWithAssignedCarrier

	err = s.Db["MONOLITH"].Table("cargo_pay_model, cargo_item").Select("AVG(cargo_pay_model.amount) as average_starting_price").
		Where("cargo_item.company_id = ? AND cargo_item.payment_id = cargo_pay_model.id", id).Scan(&result).Error
	if err != nil {
		return nil, err
	}
	err = s.Db["MONOLITH"].Table("cargo_pay_model, cargo_item").Select("AVG(cargo_pay_model.start_amount) as average_final_freight_price").
		Where("cargo_item.company_id = ? AND cargo_item.payment_id = cargo_pay_model.id", id).Scan(&result).Error
	if err != nil {
		return nil, err
	}

	return &result, nil
}
