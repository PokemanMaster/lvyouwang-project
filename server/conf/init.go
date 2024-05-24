package conf

import (
	"github.com/joho/godotenv"
	"qiqi-go/cache"
	"qiqi-go/models"
)

func Init() {
	godotenv.Load()

	// 读取翻译文件
	//if err := LoadLocales("conf/locales/zh-cn.yaml"); err != nil {
	//	logging.Info(err)
	//	panic(err)
	//}

	// 数据库的连接
	models.InitDB()
	cache.InitRedis()
}
