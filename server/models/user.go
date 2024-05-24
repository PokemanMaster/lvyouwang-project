package models

import (
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

// 用户状态
const (
	// PassWordCost 密码加密难度
	PassWordCost = 12
	// Active 激活用户
	Active string = "active"
	// Inactive 未激活用户
	Inactive string = "inactive"
	// Suspend 被封禁用户
	Suspend string = "suspend"
)

// User 用户表
type User struct {
	gorm.Model
	UserName  string `gorm:"unique"`
	Email     string `gorm:"unique"`
	Telephone string `gorm:"unique"`   // 用户电话
	Password  string `json:"password"` // 用户密码
	Nickname  string `json:"nickname"` // 用户昵称
	Status    string `json:"status"`   // 用户状态
	Limit     int    `json:"limit"`    // 用户与某种关系的限制
	Avatar    string `json:"avatar"`   // 用户头像
}

// SetPassword 设置密码
func (user *User) SetPassword(password string) error {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), PassWordCost)
	if err != nil {
		return err
	}
	user.Password = string(bytes)
	return nil
}

// CheckPassword 校验密码
func (user *User) CheckPassword(password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
	return err == nil
}
