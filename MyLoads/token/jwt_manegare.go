package token

import (
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"github.com/pkg/errors"
	"strconv"
	"time"
)

type TokenManager interface {
	NewJWT(userID string) (string, error)
	ParseToken(accesToken string) (*int64, error)
}

type tokenManager struct {
	loginKey string
}

func NewManager(loginKey string) TokenManager {
	return &tokenManager{loginKey: loginKey}
}

func (t *tokenManager) NewJWT(userID string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.StandardClaims{
		ExpiresAt: time.Now().Add(time.Hour * 72).Unix(),
		Subject:   userID,
	})

	return token.SignedString([]byte(t.loginKey))
}

func (t *tokenManager) ParseToken(accesToken string) (*int64, error) {
	token, err := jwt.Parse(accesToken, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, errors.Errorf("Неопределённый метод формирования токена")
		}
		return []byte(t.loginKey), nil
	})
	if err != nil {
		return nil, err
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		return nil, fmt.Errorf("cannot get claims from token")
	}
	atoi, err := strconv.Atoi(claims["sub"].(string))
	if err != nil {
		return nil, fmt.Errorf("cannot convert str to int %v", err)
	}
	id := int64(atoi)

	return &id, nil
}
