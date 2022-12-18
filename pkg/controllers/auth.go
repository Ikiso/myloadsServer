package controllers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

type login struct {
	Username string `json:"username"`
}

func (c *Controller) Login(context *gin.Context) {
	var s login

	if err := context.ShouldBindJSON(&s); err != nil {
		context.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"Unauthorized": err.Error()})
		return
	}

	var token, err = c.s.Login(s.Username)

	if err != nil {
		context.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"Unauthorized": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"token": *token,
	})
}
