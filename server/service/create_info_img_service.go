package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// CreateInfoImgService 商品详情图片创建的服务
type CreateInfoImgService struct {
	ProductID uint   `form:"product_id" json:"product_id"`
	ImgPath   string `form:"img_path" json:"img_path"`
}

// Create 创建商品详情图片
func (service *CreateInfoImgService) Create() serializer.Response {
	infoImg := models.ProductInfoImg{
		ProductID: service.ProductID,
		ImgPath:   service.ImgPath,
	}
	code := e.SUCCESS
	err := models.DB.Create(&infoImg).Error
	if err != nil {
		logging.Info(err)
		code := e.ERROR_DATABASE
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
