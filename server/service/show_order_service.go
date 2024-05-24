package service

import (
	"github.com/jinzhu/gorm"
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// ShowOrderService 订单详情的服务
type ShowOrderService struct {
}

// Show 订单
func (service *ShowOrderService) Show(num string) serializer.Response {
	var order models.Order
	var product models.Product
	code := e.SUCCESS
	//根据id查找order
	if err := models.DB.Where("order_num=?", num).First(&order).Error; err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}
	//根据order查找product
	if err := models.DB.Where("id=?", order.ProductID).First(&product).Error; err != nil {
		//如果查询不到，返回相应错误
		if gorm.IsRecordNotFoundError(err) {
			logging.Info(err)
			code = e.ERROR_NOT_EXIST_PRODUCT
			return serializer.Response{
				Status: code,
				Msg:    e.GetMsg(code),
			}
		}
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
		}
	}

	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
		Data:   serializer.BuildOrder(order, product),
	}
}
