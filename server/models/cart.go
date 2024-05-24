package models

import "gorm.io/gorm"

// Cart 购物车表
type Cart struct {
	gorm.Model
	UserID    uint `json:"user_id"`    // 用户id
	ProductID uint `json:"product_id"` // 商品id
	Num       uint `json:"num"`        // 商品数量
	MaxNum    uint `json:"max_num"`    // 订单号
	Check     bool `json:"check"`      // 是否被选中
}
