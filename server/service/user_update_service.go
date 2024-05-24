package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// UserUpdateService 前端请求过来的数据
type UserUpdateService struct {
	ID       uint   `form:"id" json:"id"`
	Nickname string `form:"nickname" json:"nickname" binding:"required,min=2,max=10"`
	UserName string `form:"user_name" json:"user_name" binding:"required,min=5,max=15"`
	Avatar   string `form:"avatar" json:"avatar"`
}

// UserUpdate 用户更新修改信息
func (service *UserUpdateService) UserUpdate() serializer.Response {
	var user models.User
	code := e.SUCCESS
	//找到用户
	err := models.DB.First(&user, service.ID).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	user.Nickname = service.Nickname
	user.UserName = service.UserName
	if service.Avatar != "" {
		user.Avatar = service.Avatar
	}
	err = models.DB.Save(&user).Error
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
		Data:   serializer.BuildUser(user),
	}
}
