package main

import (
	"qiqi-go/conf"
	"qiqi-go/route"
)

func main() {
	// 初始化配置
	conf.Init()

	// 路由连接
	router := route.CollectRoute()

	// 启动 HTTPS 服务器
	panic(router.Run(":3000"))
}
