import AA from './index.module.css';
import {useParams} from "react-router-dom";
import React, {useEffect, useState} from "react";
import {ShowProductAPI} from "../../api/products";
import {CreateFavoriteAPI} from "../../api/favorites";
import {CreateCartAPI} from "../../api/carts";
import {Button, Col, Modal, Row} from 'antd';
import {ShowParamImgsAPI} from "../../api/img";

export default function Details() {
    const user = JSON.parse(localStorage.getItem("user")); // 获取用户数据
    const UserId = user ? user.id : null; // 检查用户数据是否存在
    const {id} = useParams();     // 获取浏览器的URL的:id

    const [Product, setProduct] = useState([])
    const [ParamImgs, setParamImgs] = useState([]);

    useEffect(() => {
        ShowProductAPI(id).then(res => {
            setProduct(res.data)
        }).catch(error => {
            console.error("Error in useEffect:", error);
        })

        ShowParamImgsAPI(id).then(res => {
            setParamImgs(res.data)
        }).catch(error => {
            console.error("Error in useEffect:", error);
        })
    }, [id])

    // 切换图片
    const ShowParamImgs = (paramImg) => {
        setProduct(prevProduct => ({
            ...prevProduct,
            img_path: paramImg
        }));
    }

    const [Message, setMessage] = useState("");

    // 点击添加到购物车
    function CreateCart() {
        CreateCartAPI({"user_id": UserId, "product_id": JSON.parse(id)}).then(res => {
            setMessage(res.msg)
            showModal()
        }).catch(error => {
            console.log(error)
        })
    }

    // 点击收藏
    function CreateFavorite() {
        CreateFavoriteAPI({"user_id": UserId, "product_id": JSON.parse(id)}).then(res => {
            setMessage(res.msg)
            showModal()
        }).catch(error => {
            console.log(error)
        })
    }

    // modal对话框
    const [isModalOpen, setIsModalOpen] = useState(false);
    const showModal = () => {
        setIsModalOpen(true);
    };
    const handleOk = () => {
        setIsModalOpen(false);
    };
    const handleCancel = () => {
        setIsModalOpen(false);
    };

    return (<>
        {Product ? <div key={Product.id}>
            {/*商品详情介绍*/}
            <div className={AA.header}>
                <div className={AA.detail}>
                    <Row className={AA.Row}>
                        {/*商品图片展示模块*/}
                        <Col xs={24} sm={24} md={24} lg={24} xl={12}>
                            <div className={AA.image}>
                                <img src={Product.img_path} alt=""/>
                            </div>
                            <div className={AA.params}>
                                {ParamImgs && ParamImgs.length > 0 ?
                                    (ParamImgs.map(item => (
                                        <div className={AA.param} key={item.id}
                                             onMouseEnter={() => {
                                                 ShowParamImgs(item.img_path)
                                             }}>
                                            <img src={item.img_path} alt=""/>
                                        </div>
                                    )))
                                    : <div></div>}
                            </div>
                        </Col>
                        <Col xs={24} sm={24} md={24} lg={24} xl={12}>
                            <div className={AA.right}>
                                {/*商品名字*/}
                                <div className={AA.name}>{Product.name}</div>
                                {/*商品金钱*/}
                                <div className={AA.money}>
                                    <span>¥{Product.discount_price}</span>
                                </div>
                                {/*商品标题*/}
                                <div className={AA.box}>
                                    {/*加入购物车*/}
                                    <div className={AA.shoppingCar}>
                                        <Button onClick={CreateCart} type="primary">
                                            加入购物车
                                        </Button>
                                        <Button onClick={CreateFavorite} type="primary">
                                            收藏
                                        </Button>
                                    </div>
                                </div>
                            </div>
                        </Col>
                    </Row>
                </div>
            </div>
        </div> : null}

        <Modal open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
            <p>{Message}</p>
        </Modal>
    </>)
}