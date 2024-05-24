package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// 添加商品到收藏夹

// CreateFavoriteService 收藏创建的服务
type CreateFavoriteService struct {
	UserID    uint `form:"user_id" json:"user_id"`
	ProductID uint `form:"product_id" json:"product_id"`
}

// Create 创建收藏夹
func (service *CreateFavoriteService) Create() serializer.Response {
	var favorite models.Favorite

	code := e.SUCCESS
	models.DB.Where("user_id=? AND product_id=?", service.UserID, service.ProductID).Find(&favorite)
	if favorite == (models.Favorite{}) {
		favorite = models.Favorite{
			UserID:    service.UserID,
			ProductID: service.ProductID,
		}
		if err := models.DB.Create(&favorite).Error; err != nil {
			logging.Info(err)
			code = e.ERROR_DATABASE
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
				Error:  err.Error(),
			}
		}
	} else {
		code = e.ERROR_EXIST_FAVORITE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}
	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
	}
}
