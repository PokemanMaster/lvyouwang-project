package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// CreateAddressService 收货地址创建的服务
type CreateAddressService struct {
	UserID  uint   `form:"user_id" json:"user_id"`
	Name    string `form:"name" json:"name"`
	Phone   string `form:"phone" json:"phone"`
	Address string `form:"address" json:"address"`
}

// Create 用户创建收货地址，同时展示自己已经创建过的地址
func (service *CreateAddressService) Create() serializer.Response {
	var address models.Address
	code := e.SUCCESS

	// 接受前端传入数据保存到address
	address = models.Address{
		UserID:  service.UserID,
		Name:    service.Name,
		Phone:   service.Phone,
		Address: service.Address,
	}

	// 创建收货地址
	err := models.DB.Create(&address).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	// 查询收货地址返回
	var addresses []models.Address
	err = models.DB.Where("user_id=?", service.UserID).Order("created_at desc").Find(&addresses).Error
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
