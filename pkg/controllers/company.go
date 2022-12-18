package controllers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func (c *Controller) GetCompanyByUser(context *gin.Context) {
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

	context.JSON(http.StatusOK, gin.H{"company": company})

}
