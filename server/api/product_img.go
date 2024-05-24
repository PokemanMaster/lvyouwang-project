package api

import (
	"github.com/gin-gonic/gin"
	"qiqi-go/pkg/logging"
	"qiqi-go/service"
)

// CreateProductImg 创建商品图片
func CreateProductImg(c *gin.Context) {
	service := service.CreateImgService{}
	if err := c.ShouldBind(&service); err == nil {
		res := service.Create()
		c.JSON(200, res)
	} else {
		c.JSON(200, ErrorResponse(err))
		logging.Info(err)
	}
}

// ShowProductImgs 商品详情接口
func ShowProductImgs(c *gin.Context) {
	service := service.ShowImgsService{}
	res := service.Show(c.Param("id"))
	c.JSON(200, res)
}
