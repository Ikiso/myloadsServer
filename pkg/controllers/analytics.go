package controllers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func (c *Controller) GetCurrierInfo(context *gin.Context) {
	carrier, err := c.s.GetInfoCarriers()
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	}

	context.JSON(200, gin.H{"carrier": carrier})
}

func (c *Controller) GetOwnersInfo(context *gin.Context) {
	owner, err := c.s.GetInfoOwners()
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	}

	context.JSON(200, gin.H{"owner": owner})
}
