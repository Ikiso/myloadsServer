package models

type Person struct {
	Id                   int64     `json:"id" gorm:"primaryKey"`
	CreatorId            int64     `json:"creator_id"`
	CompanyStatus        int       `json:"company_status"`
	Email                string    `json:"email"`
	EmailVerify          bool      `json:"email_verify"`
	EmailVerifyToken     string    `json:"email_verify_token"`
	Enabled              bool      `json:"enabled"`
	PassWord             string    `json:"pass_word"`
	RegistrationComplete bool      `json:"registration_complete"`
	Role                 int       `json:"role"`
	Source               int       `json:"source"`
	CompanyId            int64     `json:"company_id" gorm:"foreignKey:id"`
	ChiefId              int64     `json:"chief_id"`
	ChiefLastName        string    `json:"chief_last_name"`
	ChiefFirstName       string    `json:"chief_first_name"`
	InfoId               int64     `json:"info_id"`
	Info                 *UserInfo `json:"user_info" gorm:"foreignKey:id"`
	UseMySign            bool      `json:"use_my_sign"`
	ProposedCompanyId    int64     `json:"proposed_company_id"`
}
