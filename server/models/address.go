package models

import "gorm.io/gorm"

// Address 收货地址模型
type Address struct {
	gorm.Model
	UserID  uint   // 用户id
	Name    string // 用户名字
	Phone   string // 用户电话
	Address string // 收货地址
}
