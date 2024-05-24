package util

import (
	"github.com/mojocn/base64Captcha"
	"time"
)

// 创建自定义的对象 。设置存储的验证码为 20240个，过期时间为 3分钟
var result = base64Captcha.NewMemoryStore(20240, 3*time.Minute)

// 配置各种类型的图片验证码的配置
// digitConfig 生成图形化数字验证码配置
func digitConfig() *base64Captcha.DriverDigit {
	digitType := &base64Captcha.DriverDigit{
		Height:   50,
		Width:    100,
		Length:   5,
		MaxSkew:  0.45,
		DotCount: 80,
	}
	return digitType
}

// CreateCode 创建图片验证码
// @Result id 验证码id
// @Result bse64s 图片base64编码
// @Result err 错误
func CreateCode() (string, string, error) {
	var driver base64Captcha.Driver
	driver = digitConfig()
	// 创建验证码并传入创建的类型的配置，以及存储的对象
	c := base64Captcha.NewCaptcha(driver, result)
	id, b64s, err := c.Generate()
	return id, b64s, err
}

// VerifyCaptcha 校验验证码
func VerifyCaptcha(id, VerifyValue string) bool {
	// result 为步骤1 创建的图片验证码存储对象
	return result.Verify(id, VerifyValue, true)
}

// GetCodeAnswer 获取验证码答案
func GetCodeAnswer(codeId string) string {
	// result 为步骤1 创建的图片验证码存储对象
	return result.Get(codeId, false)
}
