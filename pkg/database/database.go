package database

import (
	"MyLoads/pkg/models"
	"MyLoads/token"
	"fmt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type ServerManager interface {
	Login(username string) (*string, error)
	GetUserByUsername(username string) (*models.Person, error)
	GetAllUser() ([]models.Person, error)
	GetUserById(id int64) (models.Person, error)
	GetUserByTokenId(id *int64) (models.Person, error)
	GetCompanyByUser(id int64) (models.CompanyModel, error)
	GetUsersByCompany(id int64) ([]models.Person, error)
	GetInfoOwners() ([]models.SHIPPER, error)
	GetCompanies() ([]models.CompanyModel, error)
	GetInfoCarriers() ([]models.CarrierOut, error)
	GetAllBids() ([]models.Bid, []models.Bid, error)
}

type Server struct {
	Db    map[string]*gorm.DB
	Token token.TokenManager
}

func NewServer(db map[string]*gorm.DB, token token.TokenManager) ServerManager {
	return &Server{Db: db, Token: token}
}

var err error

func ConnectDB(BDMonolith, BDAuction, BDPayment string) map[string]*gorm.DB {

	db := make(map[string]*gorm.DB)

	db["MONOLITH"], err = gorm.Open(postgres.Open(BDMonolith))
	db["AUCTION"], err = gorm.Open(postgres.Open(BDAuction))
	db["PAYMENT"], err = gorm.Open(postgres.Open(BDPayment))

	if err != nil {
		panic(fmt.Sprint("Не удалось подключиться к базе данных ", err))
	}

	return db
}
