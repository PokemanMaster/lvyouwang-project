import request from '../index'

const UserId = JSON.parse(localStorage.getItem("user")).id;
const token = localStorage.getItem("token");

const api = {
    ListRanking: "api/v1/rankings", // 排行榜/热门
};


