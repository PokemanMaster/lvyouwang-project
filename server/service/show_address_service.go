package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ShowAddressesService 展示收货地址的服务
type ShowAddressesService struct{}

// Show 展示用户的收货地址
func (service *ShowAddressesService) Show(id string) serializer.Response {
	var addresses []models.Address
	code := e.SUCCESS

	// 查询收货地址并返回
	err := models.DB.Where("user_id=?", id).Order("created_at desc").Find(&addresses).Error
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
		Data:   serializer.BuildAddresses(addresses),
	}
}
