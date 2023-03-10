package database

import (
	"MyLoads/pkg/models"
	"github.com/pkg/errors"
)

func (s *Server) GetAllUser() ([]models.Person, error) {
	var persons []models.Person
	err := s.Db["MONOLITH"].Table("person").Order("person.chief_id").Find(&persons).Error

	if err != nil {
		return persons, err
	}

	for i := range persons {
		var userInfo models.UserInfo
		var chiefInfo models.UserInfo
		var chief models.Person
		err = s.Db["MONOLITH"].Table("user_info").Find(&userInfo, "id = ?", persons[i].InfoId).Error
		if err != nil {
			return persons, err
		}
		persons[i].Info = userInfo

		err = s.Db["MONOLITH"].Table("person").Find(&chief, "id = ?", persons[i].ChiefId).Error
		if err != nil {
			return persons, err
		}

		err = s.Db["MONOLITH"].Table("user_info").Find(&chiefInfo, "id = ?", chief.InfoId).Error
		if err != nil {
			return persons, err
		}

		persons[i].ChiefLastName = chiefInfo.LastName
		persons[i].ChiefFirstName = chiefInfo.FirstName
	}

	return persons, nil
}

func (s *Server) GetUserById(id int64) (models.Person, error) {
	var person models.Person
	err := s.Db["MONOLITH"].Table("person").First(&person, "id = ?", id).Error
	if err != nil {
		return person, errors.Errorf("Cannot be find user by id %v ", err)
	}

	var userInfo models.UserInfo

	err = s.Db["MONOLITH"].Table("user_info").First(&userInfo, "id = ?", person.InfoId).Error

	person.Info = userInfo

	return person, nil
}

func (s *Server) GetUserByTokenId(id *int64) (models.Person, error) {
	var person models.Person
	err := s.Db["MONOLITH"].Table("person").First(&person, "id = ?", id).Error

	if err != nil {
		return person, errors.Errorf("Cannot be find user by id %v ", err)
	}

	var userInfo models.UserInfo

	err = s.Db["MONOLITH"].Table("user_info").First(&userInfo, "id = ?", person.InfoId).Error

	person.Info = userInfo

	return person, nil
}

func (s *Server) GetUsersByCompany(id int64) ([]models.Person, error) {
	var persons []models.Person
	err := s.Db["MONOLITH"].Table("person").Find(&persons, "company_id = ?", id).Error

	if err != nil {
		return persons, errors.Errorf("Cannot be find user by id %v ", err)
	}

	for i := range persons {
		var userInfo models.UserInfo
		err = s.Db["MONOLITH"].Table("user_info").Find(&userInfo, "id = ?", persons[i].InfoId).Error
		if err != nil {
			return persons, err
		}
		persons[i].Info = userInfo

		err = s.Db["MONOLITH"].Table("user_info").Find(&userInfo, "id = ?", persons[i].ChiefId).Error
		if err != nil {
			return persons, err
		}
		persons[i].ChiefLastName = userInfo.LastName
		persons[i].ChiefFirstName = userInfo.FirstName
	}

	return persons, nil
}
