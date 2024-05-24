package api

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"qiqi-go/pkg/logging"
	"qiqi-go/pkg/util/sdk"
	"qiqi-go/serializer"
	"qiqi-go/service"
)

// UserRegister 用户注册接口
func UserRegister(ctx *gin.Context) {
	session := sessions.Default(ctx)
	status := session.Get(sdk.GEETEST_SERVER_STATUS_SESSION_KEY)
	userID := session.Get("userId")
	services := service.UserRegisterService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.UserRegister(userID, status)
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// UserLogin 用户登录接口
func UserLogin(ctx *gin.Context) {
	session := sessions.Default(ctx)
	status := session.Get(sdk.GEETEST_SERVER_STATUS_SESSION_KEY)
	userID := session.Get("userId")
	services := service.UserLoginService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.UserLogin(userID, status)
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// UserUpdate 修改用户信息
func UserUpdate(ctx *gin.Context) {
	services := service.UserUpdateService{}
	err := ctx.ShouldBind(&services)
	if err != nil {
		ctx.JSON(400, ErrorResponse(err))
		logging.Info(err)
	} else {
		res := services.UserUpdate()
		ctx.JSON(200, res) // 解析数据JSON
	}
}

// UserCategoryImages 给用户返回base64码的图片
func UserCategoryImages(ctx *gin.Context) {
	services := service.UserCategoryService{}
	res := services.UserCategoryImages()
	ctx.JSON(200, res)
}

// UserToken 检测用户token
func UserToken(ctx *gin.Context) {
	ctx.JSON(200, serializer.Response{
		Status: 200,
		Msg:    "ok",
	})
}
