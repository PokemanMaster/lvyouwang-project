package api

import (
	"github.com/gin-gonic/gin"
	"qiqi-go/service"
)

// ListRanking 排行
func ListRanking(c *gin.Context) {
	services := service.ListRankingService{}
	res := services.List()
	c.JSON(200, res)
}

// ListElecRanking 家电排行
func ListElecRanking(c *gin.Context) {
	services := service.ListElecRankingService{}
	res := services.List()
	c.JSON(200, res)
}

// ListAcceRanking 配件排行
func ListAcceRanking(c *gin.Context) {
	services := service.ListAcceRankingService{}
	res := services.List()
	c.JSON(200, res)
}
