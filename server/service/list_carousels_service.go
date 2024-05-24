package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ListCarouselsService 视频列表服务
type ListCarouselsService struct {
}

// List 视频列表
func (service *ListCarouselsService) List() serializer.Response {
	var carousels []models.Carousel
	code := e.SUCCESS

	if err := models.DB.Find(&carousels).Error; err != nil {
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
		Data:   serializer.BuildCarousels(carousels),
	}
}
