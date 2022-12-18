package models

type CompanyModel struct {
	Id                         int64  `json:"id" gorm:"primaryKey"`
	BankName                   string `json:"bank_name"`
	Bik                        string `json:"bik"`
	BillingAccount             string `json:"billing_account"`
	FactAddress                string `json:"fact_address"`
	Industry                   int    `json:"industry"`
	INN                        string `json:"inn"`
	JuridicalRating            string `json:"juridical_rating"`
	KPP                        string `json:"kpp"`
	KS                         string `json:"ks"`
	LegalAddress               string `json:"legal_address"`
	LoadingMachines            string `json:"loading_machines"`
	ModerationStatus           int    `json:"moderation_status"`
	Name                       string `json:"name"`
	NumberOfCars               string `json:"number_of_cars"`
	OGM                        string `json:"ogm"`
	PoolDocumentListFileId     int64  `json:"pool_document_list_file_id"`
	PoolOfferFileId            int64  `json:"pool_offer_file_id"`
	PoolRecipientAddress       string `json:"pool_recipient_address"`
	PoolRecipientEmailAndPhone string `json:"pool_recipient_email_and_phone"`
	PoolRecipientName          string `json:"pool_recipient_name"`
	OwnerId                    int64  `json:"owner_id"`
	RegionId                   int64  `json:"region_id"`
	KindOfBusiness             string `json:"kind_of_business"`
	SelectedCarrierId          int64  `json:"selected_carrier_id"`
	DisableCargoMoving         bool   `json:"disable_cargo_moving"`
}
