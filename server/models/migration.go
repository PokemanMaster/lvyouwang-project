package models

func migration() {
	// 自动迁移模式
	err := DB.Set("gorm:table_options", "charset=utf8mb4").
		AutoMigrate(
			&Address{},
			&Admin{},
			&Cart{},
			&Carousel{},
			&Category{},
			&Favorite{},
			&Notice{},
			&Order{},
			&Product{},
			&ProductImg{},
			&ProductInfoImg{},
			&ProductParamImg{},
			&User{},
			&UserAuth{},
		)
	if err != nil {
		return
	}
}
