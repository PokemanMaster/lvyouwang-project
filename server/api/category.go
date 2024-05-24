package api

import (
	"github.com/gin-gonic/gin"
	"qiqi-go/pkg/logging"
	"qiqi-go/service"
)

// CreateCategory 创建分类
func CreateCategory(c *gin.Context) {
	services := service.CreateCategoryService{}
	if err := c.ShouldBind(&services); err == nil {
		res := services.Create()
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}

// ListCategories 分类列表接口
func ListCategories(c *gin.Context) {
	services := service.ListCategoriesService{}
	if err := c.ShouldBind(&services); err == nil {
		res := services.List()
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}
