package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ShowCartService 前端传递过来的数据
type ShowCartService struct{}

// Show 获取购物车的商品
func (service *ShowCartService) Show(id string) serializer.Response {
	var carts []models.Cart
	code := e.SUCCESS

	err := models.DB.Where("user_id=?", id).Find(&carts).Error
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
		Data:   serializer.BuildCarts(carts),
	}
}
