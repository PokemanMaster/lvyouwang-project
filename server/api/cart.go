package api

import (
	"github.com/gin-gonic/gin"
	"qiqi-go/pkg/logging"
	"qiqi-go/service"
)

// CreateCart   添加商品到购物车接口
func CreateCart(ctx *gin.Context) {
	services := service.CreateCartService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.Create()
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// ShowCart 展示购物车接口
func ShowCart(ctx *gin.Context) {
	services := service.ShowCartService{}
	res := services.Show(ctx.Param("id"))
	ctx.JSON(200, res) // 解析数据JSON
}

// UpdateCart 修改购物车信息
func UpdateCart(ctx *gin.Context) {
	services := service.UpdateCartService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.Update()
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// DeleteCart 移除购物车接口
func DeleteCart(ctx *gin.Context) {
	services := service.DeleteCartService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.Delete()
		ctx.JSON(200, res) // 解析数据JSON
	}
}
