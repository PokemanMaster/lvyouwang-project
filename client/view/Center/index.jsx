import React, {useEffect, useState} from "react";
import S from './index.module.css';
import {Col, Row} from "antd";
import {useNavigate} from "react-router-dom";
import {ListOrdersAPI} from "../../api/orders";
import {ShowFavoritesAPI} from "../../api/favorites";

export default function Center() {
    const [UserInfo, setUserInfo] = useState(JSON.parse(localStorage.getItem("user")));
    const navigateTo = useNavigate()
    const [OrderNum, setOrderNum] = useState(0)
    const [FavoritesNum, setFavoritesNum] = useState(0)

    useEffect(() => {
        ListOrdersAPI().then(res => {
            if (res.data.items > 0) {
                setOrderNum(res.data.items.length)
            }
        })
        ShowFavoritesAPI().then(res => {
            if (res.data.items > 0) {
                setOrderNum(res.data.items.length)
            }
        })
    }, [])

    return (
        <div className={S.CenterLayout}>
            {UserInfo ? (
                <div className={S.CenterContent}>
                    {/* 个人信息头部 */}
                    <div className={S.CenterUser}>
                        <Row>
                            <Col xs={24} sm={24} md={12} lg={12} xl={12}>
                                <div className={S.User}>
                                    <div className={S.UserAvator}>
                                        <img src={UserInfo.avatar} alt=""/>
                                    </div>
                                    <div className={S.UserInfo}>
                                        <p style={{
                                            fontSize: '25px',
                                            fontWeight: 100,
                                            color: '#464547'
                                        }}>{UserInfo.nickname}</p>
                                        <p><a onClick={() => {
                                            navigateTo("/layout/user/details")
                                        }}
                                              style={{fontSize: '13px', color: '#ff6700'}}>修改个人信息 &gt;</a></p>
                                    </div>
                                </div>
                            </Col>
                            <Col xs={24} sm={24} md={12} lg={12} xl={12}>
                                <div className={S.MSG}>
                                    <div className={S.UserMessage}>
                                        <ul>
                                            <li>账户安全：</li>
                                            <li>邮箱：</li>
                                        </ul>
                                    </div>
                                    <div className={S.UserData}>
                                        <ul>
                                            <li>普通</li>
                                            <li>
                                                {"" === '1' ? (
                                                    <span>点此<a>绑定邮箱</a></span>
                                                ) : (
                                                    <span>{UserInfo.email}<a>『解除绑定』</a></span>
                                                )}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </Col>
                        </Row>
                    </div>
                    <div>
                        <Row>
                            <Col xs={24} sm={24} md={12} lg={12} xl={12}>
                                <div className={S.UserDetails} onClick={() => {
                                    navigateTo("/layout/personal/order")
                                }}>
                                    <div>
                                        <img src="https://s01.mifile.cn/i/user/portal-icon-1.png" alt={""}/>
                                    </div>
                                    <div className={S.Operate}>
                                        <p className={S.OperTitle}>待支付订单：{OrderNum}</p>
                                        <p>
                                            <router-link to="/order?type=1"
                                                         className={S.OperHref}>查看待支付订单 &gt;</router-link>
                                        </p>
                                    </div>
                                </div>
                            </Col>
                            <Col xs={24} sm={24} md={12} lg={12} xl={12}>
                                <div className={S.UserDetails} onClick={() => {
                                    navigateTo("/layout/personal/order")
                                }}>
                                    <div>
                                        <img src="https://s01.mifile.cn/i/user/portal-icon-2.png" alt={""}/>
                                    </div>
                                    <div className={S.Operate}>
                                        <p className={S.OperTitle}>已付款订单：{OrderNum}</p>
                                        <p>
                                            <router-link to="/order?type=2"
                                                         className={S.OperHref}>查看已付款订单 &gt;</router-link>
                                        </p>
                                    </div>
                                </div>
                            </Col>
                            <Col xs={24} sm={24} md={12} lg={12} xl={12}>
                                <div className={S.UserDetails} onClick={() => {
                                    navigateTo("/layout/personal/order")
                                }}>
                                    <div>
                                        <img src="https://s01.mifile.cn/i/user/portal-icon-3.png" alt={""}/>
                                    </div>
                                    <div className={S.Operate}>
                                        <p className={S.OperTitle}>待评价商品：{OrderNum}</p>
                                        <p>
                                            <router-link to="/"
                                                         className={S.OperHref}>查看待评价订单 &gt;</router-link>
                                        </p>
                                    </div>
                                </div>
                            </Col>
                            <Col xs={24} sm={24} md={12} lg={12} xl={12}>
                                <div className={S.UserDetails} onClick={() => {
                                    navigateTo("/layout/personal/favorite")
                                }}>
                                    <div>
                                        <img src="https://s01.mifile.cn/i/user/portal-icon-4.png" alt={""}/>
                                    </div>
                                    <div className={S.Operate}>
                                        <p className={S.OperTitle}>收藏的商品：{FavoritesNum}</p>
                                        <p>
                                            <router-link to="/favorite"
                                                         className={S.OperHref}>查看收藏的商品 &gt;</router-link>
                                        </p>
                                    </div>
                                </div>
                            </Col>
                        </Row>
                    </div>
                </div>
            ) : <div></div>}
        </div>
    )
}
