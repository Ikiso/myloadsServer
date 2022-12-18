package controllers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetCurrierInfo(c *gin.Context) {

}

func (c *Controller) GetOwnerInfo(context *gin.Context) {
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

	owner, err := c.s.GetInfoOwnerByCompanyId(company.Id)
	if err != nil {
		context.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	}

	context.JSON(200, gin.H{"owner": owner})
}
