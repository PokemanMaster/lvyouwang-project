import React, {useEffect, useState} from "react";
import AA from './index.module.css'
import {Button, Col, Modal, Menu, Row} from "antd";
import {DeleteCartAPI, ShowCartAPI, UpdateCartAPI} from "../../api/carts";
import {useNavigate} from "react-router-dom";
import {Link} from "@mui/joy";
import clogo from "../../public/images/clogo.png"
import emptyCart from "../../public/images/cart_empty.png";
import {DeleteOutlined} from "@ant-design/icons";

export default function Cart() {
    const navigateTo = useNavigate() // 路由
    const user = JSON.parse(localStorage.getItem("user")); // 获取用户数据
    const UserId = user ? user.id : null; // 检查用户数据是否存在
    const [cart, setCart] = useState([]); // 存放商品
    const [totalPrice, setTotalPrice] = useState(0); // 总价
    const [selectAll, setSelectAll] = useState(false); // 全选按钮


    // 展示购物车
    useEffect(() => {
        ShowCartAPI()
            .then(res => {
                setCart(res.data);
            }).catch(error => {
        });
    }, []);


    // 标记勾选状态
    function ToggleChecked(index) {
        const newShopCar = [...cart];
        newShopCar[index].check = !newShopCar[index].check;
        const allSelected = newShopCar.every(item => item.check); // 更新 selectAll 状态
        setSelectAll(allSelected);
        setCart(newShopCar); // 更新购物车状态
        const totalPrice = newShopCar.reduce((acc, item) => { // 计算总价
            if (item.check && item.num && item.discount_price) {
                return acc + parseFloat(item.discount_price) * item.num;
            }
            return acc;
        }, 0);
        setTotalPrice(parseFloat(totalPrice.toFixed(2)));
    }


    // 全选按钮
    function allClick() {
        const allSelected = !selectAll;
        const totalPrice = cart.reduce((acc, item) => {
            if (item.check !== allSelected) {
                item.check = allSelected;
            }
            if (item.check) {
                return acc + parseFloat(item.discount_price) * item.num;
            }
            return acc;
        }, 0);
        setCart([...cart]); // 强制更新 Index 数组，以触发重新渲染
        setSelectAll(allSelected);
        setTotalPrice(parseFloat(totalPrice.toFixed(2)));
    }


    // 提交订单
    const ShopEverything = () => {
        const checkedCart = cart.filter(item => item.check === true);
        if (checkedCart != null && checkedCart.length > 0) {
            navigateTo("/layout/order/details/", {
                state: {
                    Cart: checkedCart[0]
                }
            })
        } else {
            alert("请选择要购买的商品！")
        }
    }


    // 选择数量按钮
    const decrement = (item) => {
        if (item.num > 1) {
            const newCart = cart.map(cartItem => {
                if (cartItem.product_id === item.product_id) {
                    return {...cartItem, num: cartItem.num - 1};
                }
                return cartItem;
            });
            setCart(newCart);

            UpdateCartAPI({
                "user_id": item.user_id,
                "product_id": item.product_id,
                "num": item.num - 1
            }).then(res => {
                console.log(res);
                updateTotalPrice(newCart); // 更新总金额
            });
        }
    };

    const increment = (item) => {
        if (item.num < 99) {
            const newCart = cart.map(cartItem => {
                if (cartItem.product_id === item.product_id) {
                    return {...cartItem, num: cartItem.num + 1};
                }
                return cartItem;
            });
            setCart(newCart);

            UpdateCartAPI({
                "user_id": item.user_id,
                "product_id": item.product_id,
                "num": item.num + 1
            }).then(res => {
                console.log(res);
                updateTotalPrice(newCart); // 更新总金额
            });
        }
    };

    // 更新总金额函数
    const updateTotalPrice = (cartItems) => {
        const totalPrice = cartItems.reduce((acc, item) => {
            if (item.check && item.num && item.discount_price) {
                return acc + parseFloat(item.discount_price) * item.num;
            }
            return acc;
        }, 0);
        setTotalPrice(parseFloat(totalPrice.toFixed(2)));
    };


    // 对话框
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [TmpID, SetTmpID] = useState("")
    const showModal = (product_id) => {
        SetTmpID(product_id)
        setIsModalOpen(true);
    };
    const handleOk = () => {
        // 删除购物车操作
        DeleteCartAPI({"user_id": UserId, "product_id": TmpID.product_id})
            .then(res => {
            }).catch(err => {
        })
        setIsModalOpen(false);
    };
    const handleCancel = () => {
        setIsModalOpen(false);
    };


    return (<div className={AA.Body}>
        {/*头部*/}
        <div className={AA.TopHeader}>
            <div className={AA.CartHeader}>
                <div className={AA.Logo}>
                    <Link to="/">
                        <img src={clogo} alt=""/>
                    </Link>
                </div>
                <div className={AA.CartHeaderContent}>
                    <p>我的购物车</p>
                </div>
            </div>
        </div>

        {/* 购物车表头开始 */}
        <Row>
            <Col xs={24} sm={24} md={24} lg={24} xl={24}>
                <div className={AA.ContentHeader}>
                    <Col xs={6} sm={6} md={5} lg={5} xl={5} className={AA.ProCheck}>
                        <div className={AA.checkBtn} onClick={allClick}
                             style={{backgroundColor: selectAll ? "red" : "white"}}></div>
                        <div>全选</div>
                    </Col>
                    <Col xs={4} sm={4} md={6} lg={4} xl={5}>
                        <div className={AA.ProName}>商品名称</div>
                    </Col>
                    <Col xs={5} sm={5} md={4} lg={4} xl={5}>
                        <div className={AA.ProNum}>数量</div>
                    </Col>
                    <Col xs={4} sm={4} md={4} lg={4} xl={5}>
                        <div className={AA.ProTotal}>价格</div>
                    </Col>
                    <Col xs={2} sm={2} md={5} lg={4} xl={4}>
                        <div className={AA.ProAction}>操作</div>
                    </Col>
                </div>
            </Col>
        </Row>
        {/* 购物车表头结束 */}

        {/*商品*/}
        <div>
            {cart ? (cart.map((item, index) => (<Col xs={24} sm={24} md={24} lg={24} xl={24} key={item.id}>
                <div className={AA.CarItem}>
                    {/* 选中按钮 */}
                    <Col xs={6} sm={6} md={5} lg={6} xl={5} className={AA.CartInfo}>
                        <div
                            style={{backgroundColor: item.check ? "red" : "white"}}
                            className={AA.CarItemCheck}
                            onClick={() => ToggleChecked(index)}
                        ></div>
                        <div className={AA.CarItemPicture}>
                            <img src={item.img_path} alt=""/>
                        </div>
                    </Col>
                    {/* 商品名称 */}
                    <Col xs={4} sm={4} md={5} lg={4} xl={5}>
                        <div className={AA.CarItemIntroduce}>
                            <span>{item.name}</span>
                        </div>
                    </Col>
                    {/* 数量 */}
                    <Col xs={5} sm={5} md={3} lg={5} xl={5}>
                        <div className={AA.CarItemNum}>
                            <button onClick={() => {
                                decrement(item)
                            }}>-
                            </button>
                            <span>{item.num}</span>
                            <button onClick={() => increment(item)}>+</button>
                        </div>
                    </Col>
                    {/* 价格 */}
                    <Col xs={5} sm={5} md={3} lg={5} xl={5}>
                        <div className={AA.CarItemMoney}>{item.discount_price}</div>
                    </Col>
                    {/* 操作 */}
                    <Col xs={1} sm={1} md={5} lg={1} xl={4} className={AA.CarItemButton}>
                        <DeleteOutlined onClick={() => showModal(item.product_id)}/>
                    </Col>
                </div>
            </Col>))) : (<div className={AA.EmptyCart}>
                {/* 此处的图片不能直接写路径，只能通过import的方式将它引入进来 */}
                <img src={emptyCart} alt="" className={AA.EmptyCartImg}/>
                <div className={AA.EmptyCartText1}>购物车竟然是空的！</div>
                <div className={AA.EmptyCartText2}>再忙，也要记得买点什么犒劳自己~</div>
            </div>)}
        </div>


        {/*提交*/}
        <Row>
            <Col xs={24} sm={24} md={24} lg={24} xl={24}>
                <div className={AA.shopCarSubmit}>
                    <Col xs={8} sm={13} md={14} lg={17} xl={19} style={{margin: ' 0 auto'}}></Col>
                    <Col xs={16} sm={11} md={10} lg={7} xl={5} style={{margin: ' 0 auto'}}>
                        <div className={AA.settle}>
                            <div className={AA.totalMoney}>
                                <span>总共:</span><span>{totalPrice.toFixed(2)}</span></div>
                            <Button type="primary" className={AA.shopCarSubmitButton} onClick={ShopEverything}>
                                <span>购买商品</span>
                            </Button>
                        </div>
                    </Col>
                </div>
            </Col>
        </Row>

        <Modal title="Basic Modal" open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
            <p>确定要删除吗?</p>
        </Modal>
    </div>)
}