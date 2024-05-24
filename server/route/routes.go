package route

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
	"qiqi-go/api"
	"qiqi-go/middleware"
	"qiqi-go/pkg/util/sdk"
)

func CollectRoute() *gin.Engine {
	router := gin.Default()
	router.Use(middleware.CORS())                      // 同源请求
	store := cookie.NewStore([]byte(sdk.VERSION))      // 创建一个基于 cookie 的会话存储
	router.Use(sessions.Sessions("my_session", store)) // 启用会话管理。

	// 未登录用户
	v1 := router.Group("/api/v1")
	{
		v1.POST("user/register", api.UserRegister)      // 用户注册
		v1.POST("user/login", api.UserLogin)            // 用户登录
		v1.GET("user/category", api.UserCategoryImages) // 验证码图片

		v1.GET("categories", api.ListCategories) // 商品分类
		v1.GET("products", api.ListProducts)     // 商品列表
		v1.GET("carousels", api.ListCarousels)   //轮播图操作

		v1.GET("imgs/:id", api.ShowProductImgs)     // 商品图片操作
		v1.GET("info-imgs/:id", api.ShowInfoImgs)   // 商品详情图片操作
		v1.GET("param-imgs/:id", api.ShowParamImgs) // 商品参数图片操作

		v1.GET("products/:id", api.ShowProduct) // 商品详情页
		v1.POST("searches", api.SearchProducts) // 搜索商品

		v1.GET("rankings", api.ListRanking)          // 排行榜/热门
		v1.GET("elec-rankings", api.ListElecRanking) // 排行榜/家电排行
		v1.GET("acce-rankings", api.ListAcceRanking) // 排行榜/配件排行

		v1.GET("notices", api.ShowNotice) //README操作

		// 已登录用户
		authed := v1.Group("/")
		authed.Use(middleware.Token())
		{
			authed.GET("ping", api.UserToken)  // 验证token
			authed.PUT("user", api.UserUpdate) // 用户修改信息操作

			authed.POST("carts", api.CreateCart)   // 创建购物车
			authed.GET("carts/:id", api.ShowCart)  // 展示购物车
			authed.PUT("carts", api.UpdateCart)    // 修改购物车
			authed.DELETE("carts", api.DeleteCart) // 删除购物车

			authed.POST("favorites", api.CreateFavorite)   // 创建收藏夹
			authed.GET("favorites/:id", api.ShowFavorites) // 展示收藏夹
			authed.DELETE("favorites", api.DeleteFavorite) // 删除收藏夹

			authed.POST("addresses", api.CreateAddress)    // 创建收货地址
			authed.GET("addresses/:id", api.ShowAddresses) // 展示收货地址
			authed.PUT("addresses", api.UpdateAddress)     // 修改收货地址
			authed.DELETE("addresses", api.DeleteAddress)  // 删除收货地址

			authed.POST("orders", api.CreateOrder)        // 创建订单
			authed.GET("user/:id/orders", api.ListOrders) // 展示用户订单列表
			authed.GET("orders/:num", api.ShowOrder)      // 订单详情
		}
	}
	//管理员
	v2 := router.Group("/api/v2")
	{
		v2.POST("/admin/register", api.AdminRegister) // 管理员注册
		v2.POST("/admin/login", api.AdminLogin)       // 管理员登录
		v2.GET("products", api.ListProducts)          //商品操作
		v2.GET("products/:id", api.ShowProduct)
		v2.GET("carousels", api.ListCarousels)   //轮播图操作
		v2.GET("imgs/:id", api.ShowProductImgs)  //商品图片操作
		v2.GET("categories", api.ListCategories) //分类操作

		authed2 := v2.Group("/")
		authed2.Use(middleware.Token())
		{
			//商品操作
			authed2.POST("products", api.CreateProduct)
			authed2.DELETE("products/:id", api.DeleteProduct)
			authed2.PUT("products", api.UpdateProduct)
			//轮播图操作
			authed2.POST("carousels", api.CreateCarousel)
			//商品图片操作
			authed2.POST("imgs", api.CreateProductImg)
			//商品详情图片操作
			authed2.POST("info-imgs", api.CreateInfoImg)
			//商品参数图片操作
			authed2.POST("param-imgs", api.CreateParamImg)
			//分类操作
			authed2.POST("categories", api.CreateCategory)
			//公告操作
			authed2.POST("notices", api.CreateNotice)
			authed2.PUT("notices", api.UpdateNotice)
		}
	}

	return router
}
