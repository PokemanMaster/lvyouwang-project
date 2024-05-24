import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    CreateOrder: "api/v1/orders", // 创建订单
    ListOrders: `api/v1/user/${UserId}/orders`, // 展示用户订单列表
    ShowOrder: "api/v1/orders/:num", // 订单详情
};


// 订单
export const CreateOrderAPI = (data) => {
    return request(api.CreateOrder, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ListOrdersAPI = () => {
    return request(api.ListOrders, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ShowOrderAPI = (num) => {
    return request(`api/v1/orders/${num}`, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};