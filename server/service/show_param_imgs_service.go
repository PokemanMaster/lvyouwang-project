package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ShowParamImgsService 商品参数图片详情的服务
type ShowParamImgsService struct {
}

// Show 商品图片
func (service *ShowParamImgsService) Show(id string) serializer.Response {
	var paramImgs []models.ProductParamImg
	code := e.SUCCESS

	err := models.DB.Where("product_id=?", id).Find(&paramImgs).Error
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
		Data:   serializer.BuildParamImgs(paramImgs),
	}
}
