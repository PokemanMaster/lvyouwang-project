import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    ListCarousels: "api/v1/carousels", // 轮播图列表
};

// 轮播图
export const ListCarouselsAPI = () => {
    return request(api.ListCarousels, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
