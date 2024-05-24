import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    CreateFavorite: "api/v1/favorites", // 创建收藏夹
    ShowFavorites: `api/v1/favorites/${UserId}`, // 展示收藏夹
    DeleteFavorite: "api/v1/favorites", // 删除收藏夹
};


// 收藏夹
export const CreateFavoriteAPI = (data) => {
    return request(api.CreateFavorite, {
        method: 'post',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ShowFavoritesAPI = () => {
    return request(api.ShowFavorites, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const DeleteFavoriteAPI = (data) => {
    return request(api.DeleteFavorite, {
        method: 'DELETE',
        data: data,
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
