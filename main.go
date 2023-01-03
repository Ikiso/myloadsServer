package main

import (
	"MyLoads/middlewares"
	"MyLoads/pkg/controllers"
	"MyLoads/pkg/database"
	"MyLoads/token"
	"MyLoads/util"
	"github.com/gin-gonic/gin"
)

func main() {
	startServices()
}

func startServices() {
	config, err := util.LoadConfig(".")
	if err != nil {
		panic("Не удалось загрузить данные с конфигурационного файла")
	}

	t := token.NewManager(config.SecretKey)

	db := database.ConnectDB(config.BDMonolith, config.BDAuction, config.BDPayment)
	database.NewServer(db, t)
	c := controllers.NewController(database.NewServer(db, t))

	r := initRouter(c)

	err = r.Run("26.252.6.100:17850")
	if err != nil {
		return
	}
}

func initRouter(c controllers.ControllerManager) *gin.Engine {
	router := gin.Default()
	router.Use(middlewares.CORSMiddleware())
	api := router.Group("/api")
	{
		api.POST("/login", c.Login)
		api.GET("/persons", c.GetAllUser)
		authorized := api.Group("/auth").Use(middlewares.Auth())
		{
			authorized.GET("/person", c.GetUserByTokenID)
			authorized.GET("/persons", c.GetUsersByCompany)
			authorized.GET("/company", c.GetCompanyByUser)
			authorized.GET("/analytic/currier", c.GetCurrierInfo)
			authorized.GET("/analytic/owner", c.GetOwnersInfo)
		}
		api.GET("/person:id", c.GetUserByID)
		api.GET("/companies", c.GetCompanies)
	}
	return router
}
