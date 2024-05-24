import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    CreateCategory: "api/v1/categories", // 创建分类
    ListCategories: "api/v1/categories", // 分类列表接口
};

// 分类页商品
export function CreateCategoryAPI() {
    return request({
        url: api.CreateCategory,
        method: 'get',
    })
}

export function ListCategoriesAPI() {
    return request({
        url: api.ListCategories,
        method: 'get',
    })
}

