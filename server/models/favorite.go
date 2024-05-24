package models

import "gorm.io/gorm"

// Favorite 收藏夹模型
type Favorite struct {
	gorm.Model
	UserID    uint
	ProductID uint
}
