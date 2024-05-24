package api

import (
	"github.com/gin-gonic/gin"
	"log"
	"qiqi-go/service"
)

// 收藏夹操作

// CreateFavorite 创建收藏接口
func CreateFavorite(ctx *gin.Context) {
	services := service.CreateFavoriteService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		log.Println("error", err)
	} else {
		res := services.Create()
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// ShowFavorites 展示收藏夹接口
func ShowFavorites(ctx *gin.Context) {
	services := service.ShowFavoritesService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		log.Println("error", err)
	} else {
		res := services.Show(ctx.Param("id"))
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// DeleteFavorite 删除收藏夹的接口
func DeleteFavorite(ctx *gin.Context) {
	services := service.DeleteFavoriteService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		log.Println("error", err)
	} else {
		res := services.Delete()
		ctx.JSON(200, res) // 解析数据JSON
	}
}
