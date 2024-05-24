package service

import (
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/pkg/util"
	"qiqi-go/serializer"
)

// UserCategoryService 前端请求过来的数据
type UserCategoryService struct{}

// UserCategoryImages 给用户返回base64码的图片
func (service *UserCategoryService) UserCategoryImages() serializer.Response {
	codeId, base64, err := util.CreateCode()
	code := e.SUCCESS
	if err != nil {
		logging.Info(err)
		code = e.ERROR
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
		Data:   serializer.BuildBase64(codeId, base64),
	}
}
