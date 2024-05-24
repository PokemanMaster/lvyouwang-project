package util

import (
	"math/rand"
	"time"
)

// RandString 返回一个随机字符串
func RandString(n int) string {
	var letters = []byte("abcdefghijklmnopqrstuvwxyz")
	result := make([]byte, n)
	for i := range result {
		result[i] = letters[rand.Intn(len(letters))]
	}
	return string(result)
}

// GenerateRandomNumber 随机生成7位数字
func GenerateRandomNumber() uint {
	rand.Seed(time.Now().UnixNano())
	return uint(rand.Intn(9000000) + 1000000)
}
