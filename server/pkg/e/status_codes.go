package e

const (
	SUCCESS                 = 200 // SUCCESS 成功
	UPDATE_PASSWORD_SUCCESS = 201 // UPDATE_PASSWORD_SUCCESS 更新密码成功
	NOT_EXIST_IDENTIFIER    = 202 // 标识不存在
	ERROR                   = 500 // 一般性错误
	INVALID_PARAMS          = 400 // 无效参数
	ERROR_CODE              = 401 // 验证码错误

	ERROR_EXIST_NICK           = 10001 // 用户昵称已存在
	ERROR_EXIST_USER           = 10002 // 用户已存在
	ERROR_NOT_EXIST_USER       = 10003 // 用户不存在
	ERROR_NOT_COMPARE          = 10004 // 不匹配的条件
	ERROR_NOT_COMPARE_PASSWORD = 10005 // 不匹配的密码
	ERROR_FAIL_ENCRYPTION      = 10006 // 加密失败
	ERROR_NOT_EXIST_PRODUCT    = 10007 // 产品不存在
	ERROR_NOT_EXIST_ADDRESS    = 10008 // 地址不存在
	ERROR_EXIST_FAVORITE       = 10009 // 收藏已存在

	ERROR_AUTH_CHECK_TOKEN_FAIL       = 20001 // 鉴权失败，检查Token失败
	ERROR_AUTH_CHECK_TOKEN_TIMEOUT    = 20002 // Token超时
	ERROR_AUTH_TOKEN                  = 20003 // Token错误
	ERROR_AUTH                        = 20004 // 鉴权失败
	ERROR_AUTH_INSUFFICIENT_AUTHORITY = 20005 // 权限不足
	ERROR_READ_FILE                   = 20006 // 读取文件失败
	ERROR_SEND_EMAIL                  = 20007 // 发送邮件失败
	ERROR_CALL_API                    = 20008 // 调用API失败
	ERROR_UNMARSHAL_JSON              = 20009 // 反序列化JSON失败
	ERROR_DATABASE                    = 30001 // 数据库错误

	ERROR_OSS = 40001 // 对象存储服务错误
)
