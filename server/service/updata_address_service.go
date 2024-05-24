package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// UpdateAddressService 收货地址修改的服务
type UpdateAddressService struct {
	ID      uint   `form:"id" json:"id"`
	UserID  uint   `form:"user_id" json:"user_id"`
	Name    string `form:"name" json:"name"`
	Phone   string `form:"phone" json:"phone"`
	Address string `form:"address" json:"address"`
}

// Update 修改购物车信息
func (service *UpdateAddressService) Update() serializer.Response {
	address := models.Address{
		UserID:  service.UserID,
		Name:    service.Name,
		Phone:   service.Phone,
		Address: service.Address,
	}
	address.ID = service.ID
	code := e.SUCCESS

	// 修改收货地址
	err := models.DB.Save(&address).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	// 查询收货地址并返回
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
