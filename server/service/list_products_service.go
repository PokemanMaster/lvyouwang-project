package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ListProductsService 视频列表服务
type ListProductsService struct {
	Limit      int  `form:"limit" json:"limit"`
	Start      int  `form:"start" json:"start"`
	CategoryID uint `form:"category_id" json:"category_id"`
}

// List 视频列表
func (service *ListProductsService) List() serializer.Response {
	var products []models.Product

	var total int64
	code := e.SUCCESS

	if service.Limit == 0 {
		service.Limit = 15
	}

	// 0：推荐、1：食品、2：水果、3：男装、4：电脑、5:医药
	if service.CategoryID == 0 {
		if err := models.DB.Model(models.Product{}).Count(&total).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}

		if err := models.DB.Limit(service.Limit).Offset(service.Start).Find(&products).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
	} else {
		if err := models.DB.Model(models.Product{}).Where("category_id=?", service.CategoryID).Count(&total).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}

		if err := models.DB.Where("category_id=?", service.CategoryID).Limit(service.Limit).Offset(service.Start).Find(&products).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
	}

	return serializer.BuildListResponse(serializer.BuildProducts(products), uint(total))
}
