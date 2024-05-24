package api

import (
	"encoding/json"
	"errors"
	"fmt"
	"gopkg.in/go-playground/validator.v8"
	"qiqi-go/conf"
	"qiqi-go/serializer"
)

// ErrorResponse 返回错误消息
func ErrorResponse(err error) serializer.Response {
	var ve validator.ValidationErrors
	if errors.As(err, &ve) {
		for _, e := range ve {
			field := conf.T(fmt.Sprintf("Field.%s", e.Field))
			tag := conf.T(fmt.Sprintf("Tag.Valid.%s", e.Tag))
			return serializer.Response{
				Status: 40001,
				Msg:    fmt.Sprintf("%s%s", field, tag),
				Error:  fmt.Sprint(err),
			}
		}
	}
	var unmarshalTypeError *json.UnmarshalTypeError
	if errors.As(err, &unmarshalTypeError) {
		return serializer.Response{
			Status: 40001,
			Msg:    "JSON类型不匹配",
			Error:  fmt.Sprint(err),
		}
	}

	return serializer.Response{
		Status: 40001,
		Msg:    "参数错误",
		Error:  fmt.Sprint(err),
	}
}
