package models

type Owner struct {
	CreatedCargo             int64   `json:"created_cargo"`
	ActiveCargoes            int64   `json:"active_cargoes"`
	DeletedCargo             int64   `json:"deleted_cargo"`
	CargoWithAssignedCarrier int64   `json:"cargo_with_assigned_carrier"`
	CargoesWithoutACarrier   int64   `json:"cargoes_without_a_carrier"`
	AverageStartingPrice     float64 `json:"average_starting_price"`
	AverageFinalFreightPrice float64 `json:"average_final_freight_price"`
	CompanyID                float64 `json:"company_id"`
}
