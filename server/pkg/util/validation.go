package util

import (
	"regexp"
	"unicode"
)

// TelephoneNumberIsTure 判断手机号真假
func TelephoneNumberIsTure(number string) bool {
	if len(number) != 11 {
		return false
	}
	phoneNumber := `^1[0-9]{10}$`
	match, err := regexp.MatchString(phoneNumber, number)
	if err != nil {
		return false
	}
	if match {
		return true
	} else {
		return false
	}
}

// PasswordIsTure 密码检测
func PasswordIsTure(password string) bool {
	// 检查密码长度是否大于6位
	if len(password) < 6 {
		return false
	}
	// 初始化字母和数字的计数器
	hasLetter := false
	hasDigit := false
	// 遍历密码中的每个字符
	for _, char := range password {
		// 检查是否为字母
		if unicode.IsLetter(char) {
			hasLetter = true
		}
		// 检查是否为数字
		if unicode.IsDigit(char) {
			hasDigit = true
		}
	}
	// 密码必须包含字母和数字
	return hasLetter && hasDigit
}
