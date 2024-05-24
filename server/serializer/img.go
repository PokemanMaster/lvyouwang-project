package serializer

import (
	"qiqi-go/models"
)

// ProductImg 商品图片序列化器
type ProductImg struct {
	ID        uint   `json:"id"`
	ProductID uint   `json:"product_id"`
	ImgPath   string `json:"img_path"`
	CreatedAt int64  `json:"created_at"`
}

// BuildImg 序列化商品图片
func BuildImg(item models.ProductImg) ProductImg {
	return ProductImg{
		ID:        item.ID,
		ProductID: item.ProductID,
		ImgPath:   item.ImgPath,
		CreatedAt: item.CreatedAt.Unix(),
	}
}

// BuildImgs 序列化商品图片列表
func BuildImgs(items []models.ProductImg) (imgs []ProductImg) {
	for _, item := range items {
		img := BuildImg(item)
		imgs = append(imgs, img)
	}
	return imgs
}

// BuildInfoImg 序列化商品详情图片
func BuildInfoImg(item models.ProductInfoImg) ProductImg {
	return ProductImg{
		ID:        item.ID,
		ProductID: item.ProductID,
		ImgPath:   item.ImgPath,
		CreatedAt: item.CreatedAt.Unix(),
	}
}

// BuildInfoImgs 序列化商品详情图片列表
func BuildInfoImgs(items []models.ProductInfoImg) (imgs []ProductImg) {
	for _, item := range items {
		img := BuildInfoImg(item)
		imgs = append(imgs, img)
	}
	return imgs
}

// BuildParamImg 序列化商品参数图片
func BuildParamImg(item models.ProductParamImg) ProductImg {
	return ProductImg{
		ID:        item.ID,
		ProductID: item.ProductID,
		ImgPath:   item.ImgPath,
		CreatedAt: item.CreatedAt.Unix(),
	}
}

// BuildParamImgs 序列化商品参数图片列表
func BuildParamImgs(items []models.ProductParamImg) (imgs []ProductImg) {
	for _, item := range items {
		img := BuildParamImg(item)
		imgs = append(imgs, img)
	}
	return imgs
}
