package service

import (
	"qiqi-go/models"
	"qiqi-go/pkg/e"
	"qiqi-go/pkg/logging"
	"qiqi-go/serializer"
)

// UpdateNoticeService 公告更新的服务
type UpdateNoticeService struct {
	NoticeID uint   `form:"notice_id" json:"notice_id"`
	Text     string `form:"text" json:"text"`
}

// Update 公告更新的服务
func (service *UpdateNoticeService) Update() serializer.Response {
	var notice models.Notice
	code := e.SUCCESS
	if err := models.DB.First(&notice, service.NoticeID).Error; err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	notice.Text = service.Text
	if err := models.DB.Save(&notice).Error; err != nil {
		logging.Info(err)
		code = e.ERROR_DATABASE
		return serializer.Response{
			Status: code,
			Msg:    e.GetMsg(code),
			Error:  err.Error(),
		}
	}
	return serializer.Response{
		Status: code,
		Msg:    e.GetMsg(code),
	}
}
