package models

type SHIPPER struct {
	InfoOwner    Owner        `json:"info_owner"`
	CompanyModel CompanyModel `json:"company_model"`
}
