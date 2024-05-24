package middleware

import (
	"github.com/dgrijalva/jwt-go"
	"qiqi-go/models"
	"time"
)

// 定义JWT加密的密钥：
// jwtKey 是一个用于加密和解密JWT的密钥。这里使用了一个简单的字符串作为密钥
var jwtKey = []byte("a_secret_create")

// Claims 定义Claims结构体：
// Claims 是一个自定义的结构体，用于表示JWT中的声明（claims）。
// 它包含了一个 UserId 字段，表示用户的ID，以及继承了 jwt.StandardClaims 结构体，
// 该结构体是JWT库中预定义的一些标准声明（如过期时间、发放时间、发放者等）。
type Claims struct {
	UserId    uint
	Telephone string
	jwt.StandardClaims
}

// ReleaseToken 函数用于生成JWT并发放给用户。它接收一个 User 对象作为参数，表示要生成JWT的用户。函数中的主要步骤包括：
// 计算token的有效期限，并创建一个 Claims 对象，设置其中的字段值，包括过期时间、发放时间、发放者等。
// 使用 jwtKey 密钥生成一个新的JWT，并将上述的 Claims 对象作为声明添加到JWT中。
// 最后，将JWT转换为字符串格式并返回。
func ReleaseToken(user models.User) (string, error) {
	//token的有效时间
	expirationTime := time.Now().Add(30 * 24 * time.Hour)
	claims := &Claims{
		UserId:    user.ID,
		Telephone: user.Telephone,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(), // 时间
			IssuedAt:  time.Now().Unix(),     //token发放的时间
			Issuer:    "jkdev.cn",            //是谁发放的token
			Subject:   "user token",          //主题
		},
	}
	//用jwt这个密钥来生成我们的token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString(jwtKey)
	//错误
	if err != nil {
		return "", err
	}
	//数据返回
	return tokenString, nil
}

// ParseToken 解析token
// ParseToken 函数用于解析JWT。它接收一个JWT字符串作为参数，并返回解析后的 Token 对象、Claims 对象和可能出现的错误。
// 函数中的主要步骤包括：
// 创建一个空的 Claims 对象用于存储解析后的声明。
// 调用 jwt.ParseWithClaims 方法解析JWT，并将解析后的声明存储到 claims 对象中。
// 在解析过程中，还需要提供一个回调函数，用于验证JWT的签名。这里的回调函数简单地返回预定义的 jwtKey 作为密钥，表示对JWT的签名进行验证。
// 最后，函数返回解析后的 Token 对象、Claims 对象和可能的错误信息。
func ParseToken(tokenString string) (*jwt.Token, *Claims, error) {
	claims := &Claims{}
	token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
		return jwtKey, nil
	})
	return token, claims, err
}
