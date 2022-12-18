package database

import (
	"MyLoads/pkg/models"
	"github.com/pkg/errors"
)

func (s *Server) GetCompanyByUser(id int64) (models.CompanyModel, error) {
	var company models.CompanyModel
	err := s.Db["MONOLITH"].Table("company_model").First(&company, "id = ?", id).Error

	if err != nil {
		return company, errors.Errorf("Cannot be find user by id %v ", err)
	}

	return company, nil
}
