package models

import "gorm.io/gorm"

// Category 分类模型
type Category struct {
	gorm.Model
	CategoryID   uint
	CategoryName string
	Num          uint
}
