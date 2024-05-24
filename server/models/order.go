package models

import (
	"github.com/go-redis/redis"
	"gorm.io/gorm"
	"os"
	"qiqi-go/cache"
	"qiqi-go/pkg/logging"
	"strconv"
	"time"
)

// Order 订单模型
type Order struct {
	gorm.Model
	UserID       uint   // 用户id
	ProductID    uint   // 商品id
	Num          uint   // 商品数量
	OrderNum     uint64 // 订单编号
	AddressName  string // 收货人姓名
	AddressPhone string // 收货人电话
	Address      string // 收货人地址
	Type         uint   // 订单状态
}

// ListenOrder 监听订单是否过期
func ListenOrder() {
	go func() {
		for {
			opt := redis.ZRangeBy{
				Min:    strconv.Itoa(0),
				Max:    strconv.Itoa(int(time.Now().Unix())),
				Offset: 0,
				Count:  10,
			}
			orderList, err := cache.RedisClient.ZRangeByScore(os.Getenv("REDIS_ZSET_KEY"), opt).Result()
			if err != nil {
				logging.Info("redis err:", err)
			}
			if len(orderList) != 0 {
				var numList []int
				for _, v := range orderList {
					i, err := strconv.Atoi(v)
					if err != nil {
						logging.Info("Atoi err:", err)
					}
					numList = append(numList, i)
				}
				if err := DB.Delete(&Order{}, "order_num IN (?)", numList).Error; err != nil {
					logging.Info("myql err:", err)
				}
				if err := cache.RedisClient.ZRem(os.Getenv("REDIS_ZSET_KEY"), orderList).Err(); err != nil {
					logging.Info("redis err:", err)
				}
			}
		}
	}()
}
