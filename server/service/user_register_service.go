package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/pkg/util"
	"qiqi-go/serializer"
)

// UserRegisterService 前端请求过来的数据
type UserRegisterService struct {
	Nickname string `form:"nickname" json:"nickname" binding:"required,min=2,max=10"`
	UserName string `form:"user_name" json:"user_name" binding:"required,min=5,max=15"`
	Password string `form:"password" json:"password" binding:"required,min=8,max=16"`
	Code     string `json:"code"`   // 用户输入的验证码
	CodeId   string `json:"codeId"` // 正确的验证码
}

// UserRegister 用户注册
func (service *UserRegisterService) UserRegister(userID, status interface{}) *serializer.Response {
	user := models.User{
		Nickname: service.Nickname,
		UserName: service.UserName,
		Status:   models.Active,
	}
	code := e.SUCCESS
	var count int64

	// 表单验证
	err := models.DB.Model(&models.User{}).Where("nickname = ?", service.Nickname).Count(&count).Error
	if err != nil {
		code = e.ERROR_DATABASE
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}
	if count > 0 {
		code = e.ERROR_EXIST_NICK
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	count = 0
	err = models.DB.Model(&models.User{}).Where("user_name = ?", service.UserName).Count(&count).Error
	if err != nil {
		code = e.ERROR_EXIST_USER
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}
	if count > 0 {
		code = e.ERROR_EXIST_USER
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	// 校验验证码
	answer := util.GetCodeAnswer(service.CodeId)
	if service.Code != answer {
		code = e.ERROR_CODE
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	// 加密密码
	if err := user.SetPassword(service.Password); err != nil {
		logging.Info(err)
		code = e.ERROR_FAIL_ENCRYPTION
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	user.Avatar = "img/avatar/avatar1.jpg"

	// 创建用户
	if err := models.DB.Create(&user).Error; err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return &serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	return &serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
	}
}
