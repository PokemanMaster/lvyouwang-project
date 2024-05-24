import React, {useEffect, useState} from "react";
import AA from './index.module.css'
import {Carousel, Col, Row} from "antd";
import {ListCarouselsAPI} from "../../api/carousels";
import shop1 from '../../public/images/shop1.jpg';
import shop2 from '../../public/images/shop2.jpg';
import {useNavigate} from "react-router-dom";
import {Link as MuiLink} from "@mui/material";

// 商品的首页
export default function Home() {
    const [ListCarousels, setListCarousels] = useState([]);
    const navigateTo = useNavigate() // 路由

    useEffect(() => {
        // 轮播图
        ListCarouselsAPI().then(res => {
            setListCarousels(res.data)
        }).catch(error => {
            console.error("Error fetching data:", error);
        })
    }, []);


    return (<>
        {/*标题*/}
        <div className={AA.body}>
            <Row className={AA.header}>
                <h1 className={AA.title}>MyTourist</h1>
            </Row>
            <Row>
                <Col xs={24} sm={24} md={24} lg={12} xl={12}>
                    <img
                        src={shop1}
                        style={{maxWidth: "100%", maxHeight: "100%"}}
                        alt=""/>
                </Col>
                <Col xs={24} sm={24} md={24} lg={12} xl={12} className={AA.Revamp}>
                    <h2>Revamp Your Wardrobe Today</h2>
                    <h3>Uncover the latest trends and timeless pieces at your doorstep in
                        Chiyoda, 13. Perfect finds for every style.</h3>
                    <button className={AA.button} onClick={() => {
                        navigateTo("/layout/goods")
                    }}>
                        Shop Now
                    </button>
                </Col>
            </Row>
            <Row>
                <h1 className={AA.title}>
                    Our services
                </h1>
            </Row>
            <Row>
                <Col xs={24} sm={24} md={24} lg={12} xl={8}>
                    <div className={AA.image}>
                        <img
                            src="https://cdn.durable.co/shutterstock/2bCwVacqIDKnyCYZGQqdw9e6MESkzkBPH1bxuYEJjoIuHlMfpWNyMM675rhiTohH.jpeg"
                            alt=""
                        />
                        <div className={AA.text}>
                            <h1>Personal Styling Assistance</h1>
                            <p>Let our team of experts help you find theperfect outfit for any occasion, ensuring
                                youlook and feel your best.</p>
                        </div>
                    </div>
                </Col>
                <Col xs={24} sm={24} md={24} lg={12} xl={8}>
                    <div className={AA.image}>
                        <img
                            src="https://cdn.durable.co/shutterstock/1p2yeRtzl93TuXwDJZhxvFd1YzeFg3hQDkovlCM2PHxi9ydwghYBSMPJCi0Xoxcw.jpeg"
                            alt=""
                        />
                        <div className={AA.text}>
                            <h1>Personal Styling Assistance</h1>
                            <p>Let our team of experts help you find theperfect outfit for any occasion, ensuring
                                youlook and feel your best.</p>
                        </div>
                    </div>
                </Col>
                <Col xs={24} sm={24} md={24} lg={12} xl={8}>
                    <div className={AA.image}>
                        <img
                            src="https://cdn.durable.co/shutterstock/1eiVEG11lM7w55dhT6569hMFryS9hW2MOZKimzabWHFrRWIbQnoZQX39gR7wErWJ.jpeg"
                            alt=""
                        />
                        <div className={AA.text}>
                            <h1>Personal Styling Assistance</h1>
                            <p>Let our team of experts help you find theperfect outfit for any occasion, ensuring
                                youlook and feel your best.</p>
                        </div>
                    </div>
                </Col>
            </Row>
            <Row>
                <Col xs={24} sm={24} md={24} lg={12} xl={12}>
                    <img
                        src={shop2}
                        style={{maxWidth: "100%", maxHeight: "100%"}}
                        alt=""/>
                </Col>
                <Col xs={24} sm={24} md={24} lg={12} xl={12} className={AA.Revamp}>
                    <h2>Revamp Your Wardrobe Today</h2>
                    <h3>Uncover the latest trends and timeless pieces at your doorstep in
                        Chiyoda, 13. Perfect finds for every style.</h3>
                    <button className={AA.button} onClick={() => {
                        navigateTo("/layout/goods")
                    }}>
                        Shop Now
                    </button>
                </Col>
            </Row>
            <Row>
                {/*轮播图*/}
                <Col xs={24} sm={24} md={24} lg={24} xl={24}>
                    <Carousel autoplay>
                        {ListCarousels && ListCarousels.length > 0 ? (ListCarousels.map(item => (
                            <div key={item.id} className={AA.ListCarousels}>
                                <img src={typeof item.img_path === 'string' ? item.img_path : ''}
                                     alt=""/>
                            </div>))) : null}
                    </Carousel>
                </Col>
            </Row>
            <Row style={{textAlign: 'center'}}>
                <Col xs={24} sm={24} md={24} lg={24} xl={24}>
                    <MuiLink href="https://beian.miit.gov.cn/" underline="none" style={{color: "#333"}}>
                        桂ICP备2023004200号-2
                    </MuiLink>
                </Col>
            </Row>
        </div>
    </>)
}