import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    CreateAddress: "api/v1/addresses", // 创建收货地址
    ShowAddresses: `api/v1/addresses/${UserId}`, // 展示收货地址
    UpdateAddress: "api/v1/addresses", // 修改收货地址
    DeleteAddress: "api/v1/addresses", // 删除收货地址
};

// 收货地址
export const CreateAddressAPI = (data) => {
    return request(api.CreateAddress, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ShowAddressesAPI = () => {
    return request(api.ShowAddresses, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const UpdateAddressAPI = (data) => {
    return request(api.UpdateAddress, {
        method: 'put',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const DeleteAddressAPI = (data) => {
    return request(api.DeleteAddress, {
        method: 'delete',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
