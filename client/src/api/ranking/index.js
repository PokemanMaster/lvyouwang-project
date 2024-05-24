import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    ListRanking: "api/v1/rankings", // 排行榜/热门
    ListElecRanking: "api/v1/elec-rankings", // 排行榜/家电排行
    ListAcceRanking: "api/v1/acce-rankings", // 排行榜/配件排行
};


// 排行榜
export const ListRankingAPI = () => {
    return request(api.ListRanking, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ListElecRankingAPI = () => {
    return request(api.ListElecRanking, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};
export const ListAcceRankingAPI = () => {
    return request(api.ListAcceRanking, {
        method: 'get',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    });
};