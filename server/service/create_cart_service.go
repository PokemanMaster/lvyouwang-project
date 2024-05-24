package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// CreateCartService 购物车创建的服务
type CreateCartService struct {
	UserID    uint `form:"user_id" json:"user_id"`
	ProductID uint `form:"product_id" json:"product_id"`
}

// Create 创建购物车
func (service *CreateCartService) Create() serializer.Response {
	var product models.Product
	code := e.SUCCESS
	err := models.DB.First(&product, service.ProductID).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	if product == (models.Product{}) {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	var cart models.Cart
	models.DB.Where("user_id=? AND product_id=?", service.UserID, service.ProductID).Find(&cart)
	//如果不存在该购物车则创建
	if cart == (models.Cart{}) {
		cart = models.Cart{
			UserID:    service.UserID,
			ProductID: service.ProductID,
			Num:       1,
			MaxNum:    10,
			Check:     false,
		}

		err = models.DB.Create(&cart).Error
		if err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Data:   serializer.BuildCart(cart, product),
		}
	} else if cart.Num < cart.MaxNum { //如果存在该购物车且num小于maxnum
		cart.Num++
		err = models.DB.Save(&cart).Error
		if err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
		return serializer.Response{
			Status: 201,
			Msg:    "商品已在购物车，数量+1",
			Data:   serializer.BuildCart(cart, product),
		}
	} else {
		return serializer.Response{
			Status: 202,
			Msg:    "超过最大上限",
		}
	}
}
