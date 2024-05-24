package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// DeleteCartService 前端传递过来的数据
type DeleteCartService struct {
	UserID    uint `form:"user_id" json:"user_id"`
	ProductID uint `form:"product_id" json:"product_id"`
}

// Delete 移除购物车的商品
func (service *DeleteCartService) Delete() serializer.Response {
	var cart models.Cart
	code := e.SUCCESS

	// 查询购物车
	err := models.DB.Where("user_id=? AND product_id=?", service.UserID, service.ProductID).Find(&cart).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	// 删除购物车
	err = models.DB.Delete(&cart).Error
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
	}
}
