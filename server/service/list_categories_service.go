package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ListCategoriesService 分类列表服务
type ListCategoriesService struct {
}

// List 视频列表
func (service *ListCategoriesService) List() serializer.Response {
	var categories []models.Category
	code := e.SUCCESS

	if err := models.DB.Find(&categories).Error; err != nil {
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
		Data:   serializer.BuildCategories(categories),
	}
}
