package middleware

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

// CORS  解决同源跨域的问题
func CORS() gin.HandlerFunc {
	// 让所有的域名都可以访问
	return func(ctx *gin.Context) {
		//"Access-Control-Allow-Origin": 设置为"*"，允许所有域名访问资源。
		ctx.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		//"Access-Control-Max-Age": 设置为"86400"（24小时），指定预检请求结果可以被缓存的时间。
		ctx.Writer.Header().Set("Access-Control-Max-Age", "86400")
		//"Access-Control-Allow-Headers": 设置为"*"，允许请求中使用所有的头部信息。
		ctx.Writer.Header().Set("Access-Control-Allow-Headers", "*")
		// "Access-Control-Allow-Credentials": 设置为"true"，表示可以携带身份凭证进行跨域请求。
		ctx.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
		ctx.Writer.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		ctx.Writer.Header().Set("Access-Control-Allow-Headers", "Origin, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
		// 如果请求的方法是HTTP选项方法（OPTIONS）。
		if ctx.Request.Method == http.MethodOptions {
			// 则中间件函数会直接返回HTTP状态码200，不会进入下一个处理程序。
			ctx.AbortWithStatus(200)
		} else {
			// 否则，请求会被传递给下一个处理程序。
			ctx.Next()
		}
	}
}
