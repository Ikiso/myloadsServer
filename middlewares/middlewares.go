package middlewares

import (
	"MyLoads/token"
	"MyLoads/util"
	"github.com/gin-gonic/gin"
	"strings"
)

func Auth() gin.HandlerFunc {
	return func(c *gin.Context) {
		conf, _ := util.LoadConfig(".")
		clientToken := c.Request.Header.Get("Authorization")
		if clientToken == "" {
			c.AbortWithStatusJSON(403, "No Authorization header provided")
			return
		}

		extractedToken := strings.Split(clientToken, "Bearer ")

		if len(extractedToken) == 2 {
			clientToken = strings.TrimSpace(extractedToken[1])
		} else {
			c.AbortWithStatusJSON(400, "Incorrect Format of Authorization Token")
			return
		}

		tokenManager := token.NewManager(conf.SecretKey)

		id, err := tokenManager.ParseToken(clientToken)
		if err != nil {
			c.AbortWithStatusJSON(401, err.Error())
			return
		}
		c.Set("id", id)

		c.Next()

	}
}

func CORSMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Access-Control-Allow-Headers, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-Wit, Refresh-Token")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "GET, POST")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}

		c.Next()
	}
}
