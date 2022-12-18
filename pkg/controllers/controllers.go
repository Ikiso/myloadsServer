package controllers

import (
	"MyLoads/pkg/database"
	"github.com/gin-gonic/gin"
)

type ControllerManager interface {
	Login(context *gin.Context)
	GetAllUser(context *gin.Context)
	GetUserByTokenID(context *gin.Context)
	GetUserByID(context *gin.Context)
	GetCompanyByUser(context *gin.Context)
	GetUsersByCompany(context *gin.Context)
	GetOwnerInfo(context *gin.Context)
}

type Controller struct {
	s database.ServerManager
}

func NewController(s database.ServerManager) ControllerManager {
	return &Controller{s: s}
}
