package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// DeleteAddressService 购物车删除的服务
type DeleteAddressService struct {
	AddressID uint `form:"address_id" json:"address_id"`
}

// Delete 删除收货地址
func (service *DeleteAddressService) Delete() serializer.Response {
	var address models.Address
	code := e.SUCCESS

	// 查询收货地址
	err := models.DB.Where("id=?", service.AddressID).Find(&address).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	// 删除收货地址并返回
	err = models.DB.Delete(&address).Error
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
