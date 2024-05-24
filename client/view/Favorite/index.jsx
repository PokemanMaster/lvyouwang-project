import React, {useEffect, useState} from 'react';
import {ShowFavoritesAPI} from "../../api/favorites";
import AA from "./index.module.css";
import {Col} from "antd";
import emptyCart from "../../public/images/cart_empty.png"
import {Link} from "@mui/joy";
import clogo from "../../public/images/clogo.png";
import {useNavigate} from "react-router-dom";


export default function Favorite() {
    const navigateTo = useNavigate();
    const [Favorites, setFavorites] = useState([])
    useEffect(() => {
        ShowFavoritesAPI().then(res => {
            setFavorites(res.data.items)
            console.log("收藏列表：", res);
        });
    }, []);

    // 商品详情 ShowProduct
    function ShowProduct(value) {
        navigateTo(`/layout/product/${value.id}`);
    }

    return (
        <>
            <div className={AA.Body}>
                {/* 头部 */}
                <div className={AA.TopHeader}>
                    <div className={AA.CartHeader}>
                        <div className={AA.Logo}>
                            <Link to="/">
                                <img src={clogo} alt=""/>
                            </Link>
                        </div>
                        <div className={AA.CartHeaderContent}>
                            <p>我的收藏夹</p>
                        </div>
                    </div>
                </div>

                {/*收藏*/}
                <div className={AA.Favorite}>
                    <div className={AA.Products}>
                        {Favorites && Favorites.length > 0 ? (
                            Favorites.map((item) => (
                                <Col xs={12} sm={8} md={6} lg={4} xl={4} key={item.id}>
                                    <div
                                        onClick={() => ShowProduct(item)}
                                        className={AA.Product}
                                    >
                                        <div className={AA.ProductImage}>
                                            <img src={item.img_path} alt={"loading..."}/>
                                        </div>
                                        <div className={AA.ProductIntroduce}>
                                            <div className={AA.ProductIntroduceName}>{item.name}</div>
                                            <div
                                                className={AA.ProductIntroduceValue}>¥{item.price}</div>
                                        </div>
                                    </div>
                                </Col>
                            ))
                        ) : (
                            <div className={AA.EmptyCart}>
                                {/* 此处的图片不能直接写路径，只能通过import的方式将它引入进来 */}
                                <img src={emptyCart} alt="" className={AA.EmptyCartImg}/>
                                <div className={AA.EmptyCartText1}>购物车竟然是空的！</div>
                                <div className={AA.EmptyCartText2}>再忙，也要记得买点什么犒劳自己~</div>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </>
    );
}
