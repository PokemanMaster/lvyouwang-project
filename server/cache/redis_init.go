package cache

import (
	"github.com/go-redis/redis"
	"qiqi-go/pkg/logging"
	"strconv"
)

var RedisClient *redis.Client

// InitRedis 初始化redis
func InitRedis() {
	db, _ := strconv.ParseUint("0", 10, 64)
	client := redis.NewClient(&redis.Options{
		Addr:     "",
		Password: "",
		DB:       int(db),
	})
	_, err := client.Ping().Result()
	if err != nil {
		logging.Info(err)
		panic(err)
	}
	RedisClient = client
}
