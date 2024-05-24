import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    CreateProduct: "api/v1/products", // 创建商品
    ListProducts: "api/v1/products", // 商品列表接口
    ShowProduct: "api/v1/products/:id", // 点击商品进入详情页
    UpdateProduct: "api/v1/products", // 更新商品的接口
    DeleteProduct: "api/v1/products/:id", // 删除商品的接口
    SearchProducts: "api/v1/searches", // 搜索商品的接口
};


// 商品
export const CreateProductAPI = (data) => {
    return request(api.CreateProduct, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ListProductsAPI = (params) => {
    return request(api.ListProducts, {
        method: 'get',
        params: params,
    });
};
export const ShowProductAPI = (id) => {
    return request(`/api/v1/products/${id}`, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const UpdateProductAPI = (data) => {
    return request(api.UpdateProduct, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const DeleteProductAPI = (data) => {
    return request(api.DeleteProduct, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const SearchProductsAPI = (data) => {
    return request(api.SearchProducts, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};