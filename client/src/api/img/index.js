import request from '../index'

const token = localStorage.getItem("token");

export const ShowParamImgsAPI = (id) => {
    return request(`api/v1/param-imgs/${id}`, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};

export const showInfoImgs = (id) => {
    return request(`api/v1/info-imgs/${id}`, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};