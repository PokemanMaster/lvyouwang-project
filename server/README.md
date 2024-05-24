# tourist-server 电子商城

## 前言

本人准备大四，拿这个项目学习一些新的技能，如果有错误或者实现不好的地方欢迎 issues
如果觉得这个项目不错，您可以右上角 Star 支持一下！谢谢您的支持，您的支持是我完善的动力！

## 项目依赖
本项目采用了一系列 golang 中比较流行的组件来进行开发

- Gin
- Gorm
- mysql
- redis
- jwt-go

## 目录结构
```
server/
├── api
├── cache
├── conf
├── middleware
├── model
├── pkg
│	├── e
│	├── util
│   ├── sdk
├── route
├── serializer
└── service
└── test
```
- api：用于定义接口函数
- cache：redis 相关操作
- conf：用于存储配置文件
- middleware：应用中间件
- model：应用数据库模型
- pkg / e：封装错误码
- pkg / util：工具函数
- pkg / sdk: 极验 sdk 核心函数
- serializer：将数据序列化为 json 的函数
- route 路由逻辑处理
- service：接口函数的实现
- test：数据库sql

## 运行
```
git clone https://github.com/PokemanMaster/Tourist-Web/server.git
cd server
go run main.go
```
项目运行后启动在 3000 端口