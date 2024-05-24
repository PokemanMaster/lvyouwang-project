package api

import (
	"github.com/gin-gonic/gin"
	"log"
	"qiqi-go/pkg/logging"
	"qiqi-go/service"
)

// CreateOrder 用户创建订单接口
func CreateOrder(ctx *gin.Context) {
	services := service.CreateOrderService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.Create()
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// ListOrders 订单详情接口
func ListOrders(ctx *gin.Context) {
	services := service.ListOrdersService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.List(ctx.Param("id"))
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// ShowOrder 展示用户订单接口
func ShowOrder(ctx *gin.Context) {
	services := service.ShowOrderService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		log.Println("error", err)
	} else {
		res := services.Show(ctx.Param("num"))
		ctx.JSON(200, res) // 解析数据JSON
	}
}
