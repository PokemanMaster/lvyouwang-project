package models

import (
	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	"time"
)

var DB *gorm.DB

// InitDB  初始化数据库
func InitDB() {
	db, err := gorm.Open(
		"mysql",
		"root:123456@tcp(47.113.104.184:3306)/tourist?charset=utf8mb4&parseTime=True&loc=Local",
		// "root:qq81880234@tcp(127.0.0.1:3306)/tourist?charset=utf8mb4&parseTime=True&loc=Local",
	)
	db.LogMode(true)
	// Error
	if err != nil {
		panic(err)
	}
	if gin.Mode() == "release" {
		db.LogMode(false)
	}
	//默认不加复数
	db.SingularTable(true)
	//设置连接池
	//空闲
	db.DB().SetMaxIdleConns(20)
	//打开
	db.DB().SetMaxOpenConns(100)
	//超时
	db.DB().SetConnMaxLifetime(time.Second * 30)

	DB = db

	// 数据库迁移
	migration()
}
