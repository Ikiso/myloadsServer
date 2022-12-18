package database

import (
	"MyLoads/pkg/models"
	"fmt"
)

func (s *Server) GetInfoOwnerByCompanyId(id int64) {
	var result models.Owner
	//AverageStartingPrice     float64 `json:"average_starting_price"`
	//AverageFinalFreightPrice float64 `json:"average_final_freight_price"`

	s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(company_id) as created_cargo").
		Where("company_id = ?", id).Find(&result)
	s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(is_deleted) as active_cargoes").
		Where("company_id = ? AND is_deleted = ?", id, false).Find(&result)
	s.Db["MONOLITH"].Table("cargo_item").Select("COUNT(selected_carrier_id) as cargo_with_assigned_carrier").
		Where("company_id = ?", id).Find(&result)

	result.DeletedCargo = result.CreatedCargo - result.ActiveCargoes
	result.CargoesWithoutACarrier = result.CreatedCargo - result.CargoWithAssignedCarrier

	fmt.Printf("%v", result)
}
