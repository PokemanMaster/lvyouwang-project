import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    CreateCart: "api/v1/carts", // 创建购物车
    ShowCart: `api/v1/carts/${UserId}`, // 展示购物车
    UpdateCart: "api/v1/carts", // 修改购物车
    DeleteCart: "api/v1/carts", // 删除购物车
};

// 购物车
export const CreateCartAPI = (data) => {
    return request(api.CreateCart, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ShowCartAPI = () => {
    return request(api.ShowCart, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const UpdateCartAPI = (data) => {
    return request(api.UpdateCart, {
        method: 'put',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const DeleteCartAPI = (data) => {
    return request(api.DeleteCart, {
        method: 'delete',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
