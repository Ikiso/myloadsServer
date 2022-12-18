package database

import (
	"MyLoads/pkg/models"
	"github.com/pkg/errors"
)

func (s *Server) GetAllUser() ([]models.Person, error) {
	var persons []models.Person
	err := s.Db["MONOLITH"].Table("person").Find(&persons).Error

	if err != nil {
		return persons, err
	}

	return persons, nil
}

func (s *Server) GetUserById(id int64) (models.Person, error) {
	var person models.Person
	err := s.Db["MONOLITH"].Table("person").First(&person, "id = ?", id).Error

	if err != nil {
		return person, errors.Errorf("Cannot be find user by id %v ", err)
	}

	return person, nil
}

func (s *Server) GetUserByTokenId(id *int64) (models.Person, error) {
	var person models.Person
	err := s.Db["MONOLITH"].Table("person").First(&person, "id = ?", id).Error

	if err != nil {
		return person, errors.Errorf("Cannot be find user by id %v ", err)
	}

	return person, nil
}

func (s *Server) GetUsersByCompany(id int64) ([]models.Person, error) {
	var persons []models.Person
	err := s.Db["MONOLITH"].Table("person").Find(&persons, "company_id = ?", id).Error

	if err != nil {
		return persons, errors.Errorf("Cannot be find user by id %v ", err)
	}

	return persons, nil
}
