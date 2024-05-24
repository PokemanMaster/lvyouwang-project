import React, {useEffect, useState} from "react";
import AA from "./index.module.css"
import {ShowOrderAPI} from "../../api/orders";
import {useLocation} from "react-router-dom";
import {Col, Row} from "antd";


export default function ConfirmOrder() {

    const location = useLocation();
    const [order, setOrder] = useState([])

    useEffect(() => {
        const orderNum = location.state && location.state.orderNum;
        ShowOrderAPI(orderNum).then(res => {
            setOrder(res.data)
        })
    }, [])


    const OrderDetails = [
        {
            id: "购物车总价",
            name: order.name,
            number: order.num,
            price: order.discount_price * order.num
        },
    ];
    const ReceiptInformation = [
        {id: "收件人", money: order.address_name},
        {id: "手机号码", money: order.address_phone},
        {id: "收货地址", money: order.address},
    ];
    const OrderInformation = [
        {id: "订单编号", money: order.order_num},
        {id: "下单时间", money: order.created_at},
    ];
    return (
        <div className={AA.body}>
            <h1>订单提交成功！</h1>
            <p>我们已经收到您的订单，将尽快为您发货。收获期间请保持手机畅通!</p>
            <div className={AA.Contain}>
                <Row>
                    <Col xs={24} sm={24} md={24} lg={24} xl={24}>
                        <div className={AA.ContainOrder}>
                            <h4>订单详情</h4>
                            <table className={AA.ContainMoney}>
                                <thead>
                                <tr>
                                    <th>图片</th>
                                    <th>商品名称</th>
                                    <th>数量</th>
                                    <th>总价</th>
                                </tr>
                                </thead>
                                <tbody>
                                {OrderDetails.map(item => (
                                    <tr key={item.id} border="1">
                                        <td className={AA.ContainOrderId}>
                                            <img
                                                src={order.img_path}
                                                alt=""/>
                                        </td>
                                        <td className={AA.ContainOrderId}>{item.name}</td>
                                        <td className={AA.ContainOrderId}>{item.number}</td>
                                        <td className={AA.ContainOrderId}>{item.price}</td>
                                    </tr>
                                ))}
                                </tbody>
                            </table>
                        </div>
                    </Col>
                </Row>
                <div className={AA.Information}>
                    <div className={AA.ReceiptInformation}>
                        <h4>收货信息</h4>
                        <table className={AA.ContainMoney}>
                            {ReceiptInformation.map(item => (
                                <tr key={item.id} border="1">
                                    <td className={AA.ContainOrderId}>{item.id}</td>
                                    <td className={AA.ContainOrderId}>{item.money}</td>
                                </tr>
                            ))}
                        </table>
                    </div>
                    <div className={AA.ReceiptInformation}>
                        <h4>订单信息</h4>
                        <table className={AA.ContainMoney}>
                            {OrderInformation.map(item => (
                                <tr key={item.id} border="1">
                                    <td className={AA.ContainOrderId}>{item.id}</td>
                                    <td className={AA.ContainOrderId}>{item.money}</td>
                                </tr>
                            ))}
                        </table>
                    </div>
                </div>
            </div>
        </div>
    )
}