package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// SearchProductsService 搜索商品的服务
type SearchProductsService struct {
	Search string `form:"search" json:"search"`
}

// Show 搜索商品
func (service *SearchProductsService) Show() serializer.Response {
	var products []models.Product
	code := e.SUCCESS

	err := models.DB.Where("name LIKE ?", "%"+service.Search+"%").Find(&products).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	var products1 []models.Product
	err = models.DB.Where("info LIKE ?", "%"+service.Search+"%").Find(&products1).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	products = append(products, products1...)
	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
		Data:   serializer.BuildProducts(products),
	}
}
