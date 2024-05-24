package service

import (
	"github.com/jinzhu/gorm"
	"qiqi-go/middleware"
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/pkg/util"
	"qiqi-go/serializer"
)

// UserLoginService 前端请求过来的数据
type UserLoginService struct {
	UserName  string `form:"user_name" json:"user_name" binding:"required,min=5,max=15"`
	Password  string `form:"password" json:"password" binding:"required,min=8,max=16"`
	Challenge string `form:"challenge" json:"challenge"`
	Validate  string `form:"validate" json:"validate"`
	Seccode   string `form:"seccode" json:"seccode"`
	Code      string `json:"code"`   // 用户输入的验证码
	CodeId    string `json:"codeId"` // 正确的验证码
}

// UserLogin 用户登录
func (service *UserLoginService) UserLogin(userID, status interface{}) serializer.Response {
	var user models.User
	code := e.SUCCESS

	if err := models.DB.Where("user_name = ?", service.UserName).First(&user).Error; err != nil {
		//如果查询不到，返回相应错误
		if gorm.IsRecordNotFoundError(err) {
			logging.Info(err)
			code = e.ERROR_NOT_EXIST_USER
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
			}
		}
		logging.Info(err)
		code = e.ERROR_NOT_COMPARE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	// 检查密码
	if user.CheckPassword(service.Password) == false {
		code = e.ERROR_NOT_COMPARE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	// 校验验证码
	answer := util.GetCodeAnswer(service.CodeId)
	if service.Code != answer {
		code = e.ERROR_CODE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	//发放token
	token, err := middleware.ReleaseToken(user)
	if err != nil {
		logging.Info(err)
		code = e.ERROR_AUTH_TOKEN
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
		Data:   serializer.TokenData{User: serializer.BuildUser(user), Token: token},
	}
}
