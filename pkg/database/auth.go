package database

import (
	"MyLoads/pkg/models"
	"github.com/pkg/errors"
	"strconv"
	"strings"
)

func (s *Server) Login(username string) (*string, error) {
	byUsername, err := s.GetUserByUsername(username)
	if err != nil {
		return nil, err
	}

	jwt, err := s.Token.NewJWT(strconv.Itoa(int(byUsername.Id)))

	return &jwt, nil
}

func (s *Server) GetUserByUsername(username string) (*models.Person, error) {
	var person models.Person
	contains := strings.Contains(username, "@")
	if !contains {
		var userInfo models.UserInfo
		s.Db["MONOLITH"].Table("user_info").Find(&userInfo, "contact_phone_number = ?", username)

		if userInfo.ID == 0 {
			return nil, errors.New("Ошибка информации по данному пользовтелю не существует")
		}
		s.Db["MONOLITH"].Table("person").First(&person, "info_id = ?", userInfo.ID)
	} else {
		s.Db["MONOLITH"].Table("person").Find(&person, "email = ?", username)
		if person.Id == 0 {
			return nil, errors.New("Ошибка данного пользовтеля в таблице person не существует")
		}
	}

	return &person, nil
}
