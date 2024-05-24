import request from '../index'

let UserId = '';
const user = JSON.parse(localStorage.getItem("user"));
const token = localStorage.getItem("token");

if (user && user.id) {
    UserId = user.id;
}


const api = {
    UserToken: "/api/v1/ping", // 检测用户token
    Register: "api/v1/user/register", // 用户注册
    Login: "api/v1/user/login", // 用户登录
    Update: "api/v1/user",
    Category: "/api/v1/user/category", //验证码
};


// 检测用户token
export const UserTokenAPI = (token) => {
    return request(api.UserToken, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    })
}

// 用户注册
export const RegisterAPI = (data) => {
    return request(api.Register, {
        method: "post",
        data: data,
    });
}

// 登录
export const LoginAPI = (data) => {
    return request(api.Login, {
        method: "post",
        data: data,
    });
}

// 用户修改信息操作
export const UpdateAPI = (data) => {
    return request(api.Update, {
        method: 'put',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    })
}

// 验证码
export const CategoryAPI = () => {
    return request(api.Category, {
        method: "get",
    });
}
