package api

import (
	"github.com/gin-gonic/gin"
	"qiqi-go/pkg/logging"
	"qiqi-go/service"
)

// CreateProduct 创建商品
func CreateProduct(c *gin.Context) {
	service := service.CreateProductService{}
	if err := c.ShouldBind(&service); err == nil {
		res := service.Create()
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}

// ListProducts 商品列表接口
func ListProducts(c *gin.Context) {
	services := service.ListProductsService{}
	if err := c.ShouldBind(&services); err == nil {
		res := services.List()
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}

// ShowProduct 点击商品进入详情页
func ShowProduct(ctx *gin.Context) {
	service := service.ShowProductService{}
	res := service.Show(ctx.Param("id"))
	ctx.JSON(200, res)
}

// DeleteProduct 删除商品的接口
func DeleteProduct(c *gin.Context) {
	services := service.DeleteProductService{}
	res := services.Delete(c.Param("id"))
	c.JSON(200, res)
}

// UpdateProduct 更新商品的接口
func UpdateProduct(c *gin.Context) {
	services := service.UpdateProductService{}
	if err := c.ShouldBind(&services); err == nil {
		res := services.Update()
		c.JSON(400, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}

// SearchProducts 搜索商品的接口
func SearchProducts(c *gin.Context) {
	services := service.SearchProductsService{}
	if err := c.ShouldBind(&services); err == nil {
		res := services.Show()
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}
