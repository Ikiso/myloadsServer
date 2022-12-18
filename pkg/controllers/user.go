package controllers

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
	"strings"
)

func (c *Controller) GetAllUser(context *gin.Context) {
	persons, err := c.s.GetAllUser()
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{
			"error": err.Error()})
		return
	}
	context.JSON(http.StatusOK, gin.H{"persons": persons})
}

func (c *Controller) GetUserByTokenID(context *gin.Context) {
	strId, _ := context.Get("id")

	id := strId.(*int64)

	person, err := c.s.GetUserByTokenId(id)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"person": person})
}

func (c *Controller) GetUserByID(context *gin.Context) {
	strId := context.Param("id")

	strId = strings.Replace(strId, ":", "", -1)

	atoi, err := strconv.Atoi(strId)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	id := int64(atoi)

	person, err := c.s.GetUserById(id)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"person": person})
}

func (c *Controller) GetUsersByCompany(context *gin.Context) {
	strId, _ := context.Get("id")

	id := strId.(*int64)

	person, err := c.s.GetUserByTokenId(id)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	company, err := c.s.GetCompanyByUser(person.CompanyId)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	persons, err := c.s.GetUsersByCompany(company.Id)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	context.JSON(http.StatusOK, gin.H{"persons": persons})
}
