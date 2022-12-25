package models

type Bid struct {
	ID            int64   `json:"id" gorm:"primaryKey"`
	Amount        float64 `json:"amount"`
	CompanyID     int64   `json:"company_id"`
	CreatorID     int64   `json:"creator_id"`
	Date          string  `json:"date"`
	Email         string  `json:"email"`
	Name          string  `json:"name"`
	Phone         string  `json:"phone"`
	Rating        float64 `json:"rating"`
	Reject        bool    `json:"reject"`
	CargoID       int64   `json:"cargo_id"`
	TaxType       int     `json:"tax_type"`
	NDSAmount     int     `json:"nds_amount"`
	RejectComment string  `json:"reject_comment"`
}
