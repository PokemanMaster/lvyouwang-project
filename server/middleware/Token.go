package middleware

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"qiqi-go/models"
	"strings"
)

// Token 验证 HTTP 请求的身份认证。
func Token() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// 获取 authorization header 中的 token
		tokenString := ctx.GetHeader("Authorization")
		// 然后检查它的格式是否正确。
		if tokenString == "" || !strings.HasPrefix(tokenString, "Bearer") {
			ctx.JSON(http.StatusUnauthorized, gin.H{
				"code": 401,
				"msg":  "权限不足",
			})
			// 用于中止当前 HTTP 请求链中的所有处理程序和中间件。
			ctx.Abort()
			return
		}
		// 因为Bearer字符占了7位，所以从7开始截取字符
		tokenString = tokenString[7:]
		// 解析传入的 JWT（JSON Web Token）字符串并返回 token 对象、token 中的声明（claims）和任何错误。
		token, claims, err := ParseToken(tokenString)
		if err != nil || !token.Valid {
			ctx.JSON(http.StatusUnauthorized, gin.H{
				"code": 402,
				"msg":  "权限不足",
			})
			ctx.Abort()
			return
		}
		//token通过验证, 获取claims中的UserID
		userId := claims.UserId
		// 连接数据库
		//DB := common.GetDB()
		var user models.User
		// 查询数据库中符合条件的第一个记录，并将结果存储在给定的变量 user 中。
		models.DB.First(&user, userId)
		// 验证用户是否存在
		if user.ID == 0 {
			ctx.JSON(http.StatusUnauthorized, gin.H{
				"code": 403,
				"msg":  "权限不足",
			})
			ctx.Abort()
			return
		}
		// 如果用户存在，则将用户信息写入 Gin 上下文中，并将请求传递给后续的处理程序。
		// 在 Gin 的上下文（Context）中设置一个键值对。
		// 可以在后续的处理程序中使用 ctx.Get("user") 获取存储在上下文中的 user 对象，以便在需要时使用它。
		ctx.Set("user", user)
		// 当前中间件已处理完请求，并将请求传递给下一个中间件或路由处理程序。
		// 如果没有调用 ctx.Next()，则当前中间件将停止执行，不会将请求传递给后续的处理程序或中间件。
		ctx.Next()
	}
}
