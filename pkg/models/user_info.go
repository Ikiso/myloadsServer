package models

type UserInfo struct {
	ID                 int64  `json:"id" gorm:"primary_key"`
	ContactEmail       string `json:"contact_email"`
	ContactPhoneNumber string `json:"contact_phone_number"`
	FirstName          string `json:"first_name"`
	LastName           string `json:"last_name"`
	PositionPerson     string `json:"position_person"`
}
