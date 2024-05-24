package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ListOrdersService 订单详情的服务
type ListOrdersService struct {
	Limit int  `form:"limit" json:"limit"`
	Start int  `form:"start" json:"start"`
	Type  uint `form:"type" json:"type" `
}

func (service *ListOrdersService) List(id string) serializer.Response {
	var orders []models.Order

	var total int64
	code := e.SUCCESS
	if service.Limit == 0 {
		service.Limit = 5
	}

	if service.Type == 0 {
		if err := models.DB.Model(&orders).Where("user_id=?", id).Count(&total).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}

		if err := models.DB.Where("user_id=?", id).Limit(service.Limit).Offset(service.Start).Order("created_at desc").Find(&orders).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
	} else {
		if err := models.DB.Model(&orders).Where("user_id=? AND type=?", id, service.Type).Count(&total).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}

		if err := models.DB.Where("user_id=? AND type=?", id, service.Type).Limit(service.Limit).Offset(service.Start).Order("created_at desc").Find(&orders).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
	}

	return serializer.BuildListResponse(serializer.BuildOrders(orders), uint(total))
}
