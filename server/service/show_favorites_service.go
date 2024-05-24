package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ShowFavoritesService 展示收藏夹详情的服务
type ShowFavoritesService struct {
	Limit int `form:"limit"`
	Start int `form:"start"`
}

func (service *ShowFavoritesService) Show(id string) serializer.Response {
	var favorites []models.Favorite
	var total int64
	code := e.SUCCESS

	if service.Limit == 0 {
		service.Limit = 12
	}

	// 查询
	if err := models.DB.Model(&favorites).Where("user_id=?", id).Count(&total).Error; err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	// 查询
	err := models.DB.Where("user_id=?", id).Limit(service.Limit).Offset(service.Start).Find(&favorites).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	return serializer.BuildListResponse(serializer.BuildFavorites(favorites), uint(total))
}
