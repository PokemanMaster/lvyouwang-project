package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// 商品类

// ShowProductService 商品详情的服务
type ShowProductService struct {
}

// Show 商品
func (service *ShowProductService) Show(id string) serializer.Response {
	var product models.Product
	code := e.SUCCESS
	err := models.DB.First(&product, id).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	//增加点击数
	product.AddView()
	if product.CategoryID == 2 || product.CategoryID == 3 {
		product.AddElecRank()
	}
	if product.CategoryID == 5 || product.CategoryID == 6 || product.CategoryID == 7 || product.CategoryID == 8 {
		product.AddAcceRank()
	}

	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
		Data:   serializer.BuildProduct(product),
	}
}
