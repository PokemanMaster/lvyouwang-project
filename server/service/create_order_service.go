package service

import (
	"fmt"
	"github.com/go-redis/redis"
	"math/rand"
	"os"
	"qiqi-go/cache"
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
	"strconv"
	"time"
)

// CreateOrderService 前端需要传入参数
type CreateOrderService struct {
	UserID    uint `form:"user_id" json:"user_id"`
	ProductID uint `form:"product_id" json:"product_id"`
	Num       uint `form:"num" json:"num"`
	AddressID uint `form:"address_id" json:"address_id"`
}

// Create 用户创建一个订单
func (service *CreateOrderService) Create() serializer.Response {
	order := models.Order{
		UserID:    service.UserID,
		ProductID: service.ProductID,
		Num:       service.Num,
		Type:      1,
	}
	address := models.Address{}
	code := e.SUCCESS

	//查找对应的地址
	if err := models.DB.First(&address, service.AddressID).Error; err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	order.AddressName = address.Name
	order.AddressPhone = address.Phone
	order.Address = address.Address

	//生成随机订单号
	number := fmt.Sprintf("%09v", rand.New(rand.NewSource(time.Now().UnixNano())).Int31n(1000000000))
	productNum := strconv.Itoa(int(service.ProductID))
	userNum := strconv.Itoa(int(service.UserID))
	number = number + productNum + userNum
	orderNum, err := strconv.ParseUint(number, 10, 64)
	if err != nil {
		logging.Info(err)
		code = e.ERROR
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	order.OrderNum = orderNum

	//存入数据库
	err = models.DB.Create(&order).Error
	if err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}

	//将订单号存入Redis,并设置过期时间
	data := redis.Z{Score: float64(time.Now().Unix()) + 15*time.Minute.Seconds(), Member: orderNum}
	cache.RedisClient.ZAdd(os.Getenv("REDIS_ZSET_KEY"), data)

	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
	}
}
