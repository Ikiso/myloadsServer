package models

type Carrier struct {
	ActiveCargoes            int64   `json:"active_cargoes"`
	BiddingForGoods          int64   `json:"bidding_for_goods"`
	DeletedCargo             int64   `json:"deleted_cargo"`
	Victory                  int64   `json:"victory"`
	Losses                   int64   `json:"losses"`
	AverageStartingPrice     float64 `json:"average_starting_price"`
	AverageFinalFreightPrice float64 `json:"average_final_freight_price"`
}

type CarrierOut struct {
	CarrierInfo Carrier      `json:"carrier_info"`
	CompanyInfo CompanyModel `json:"company_info"`
}
