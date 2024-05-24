import S from './index.module.css'
import {Button, Drawer, Form, Input, Modal} from "antd";
import React, {useEffect, useState} from "react";
import {CreateAddressAPI, DeleteAddressAPI, ShowAddressesAPI, UpdateAddressAPI} from "../../api/addresses";
import emptyCart from "../../public/images/cart_empty.png"
import {Link} from "@mui/joy";
import clogo from "../../public/images/clogo.png";
import {cityData} from "../../data/city";

export default function UserAddress() {
    const user = JSON.parse(localStorage.getItem("user")); // 获取用户数据
    const UserId = user ? user.id : null; // 检查用户数据是否存在
    const [form] = Form.useForm();

    // 展示收货地址信息
    const [ShowAddresses, setShowAddresses] = useState([])
    useEffect(() => {
        ShowAddressesAPI().then(res => {
            console.log("展示收货地址信息", res)
            setShowAddresses(res.data)
        }).catch(err => {
            console.log(err)
        });
    }, [])

    // 删除收货地址
    const delectAddress = (id) => {
        DeleteAddressAPI({"address_id": id})
            .then(res => {
                console.log("删除收货地址", res)
            }).catch(err => {
            console.log(err)
        })
        window.location.reload();
    }

    // 添加收货地址
    const [isCreateAddressModalOpen, setIsCreateAddressModalOpen] = useState(false);
    const CreateAddressModal = (bool) => {
        setIsCreateAddressModalOpen(bool);
    };
    const CreateAddress = () => { // 表单提交
        form.validateFields().then(values => {
            // 在这里执行您的提交逻辑
            const addressesValue = values["addresses"];
            const telephoneValue = values["telephone"];
            const drawerValue = values["drawer"];
            const detailsValue = values["details"];
            const addressValue = drawerValue + '-' + detailsValue;
            // 添加收货地址
            CreateAddressAPI({
                "user_id": UserId, "name": addressesValue, "phone": telephoneValue, "address": addressValue
            }).then(res => {
                console.log("添加收货地址", res)
            }).catch(err => {
                console.log(err)
            })
            CreateAddressModal(false);
            window.location.reload();
        }).catch(errorInfo => {
            console.log('表单验证失败:', errorInfo);
        });
    };

    // 修改收货地址
    const [isUpdateAddressModalOpen, setIsUpdateAddressModalOpen] = useState(false);
    const [UpdateAddressId, setUpdateAddressId] = useState("");
    const UpdateAddressModal = (bool, id, name, phone) => {
        form.setFieldsValue({addresses: name, telephone: phone});
        setUpdateAddressId(id);
        setIsUpdateAddressModalOpen(bool);
    };
    const UpdateAddress = () => {
        form.validateFields().then(values => {
            // 在这里执行您的提交逻辑
            const addressesValue = values["addresses"];
            const telephoneValue = values["telephone"];
            const drawerValue = values["drawer"];
            const detailsValue = values["details"];
            const addressValue = drawerValue + '-' + detailsValue;
            // 添加收货地址
            UpdateAddressAPI({
                "user_id": UserId,
                "id": UpdateAddressId,
                "name": addressesValue,
                "phone": telephoneValue,
                "address": addressValue
            }).then(res => {
                console.log("添加收货地址", res)
            }).catch(err => {
                console.log(err)
            })
            UpdateAddressModal(false);
            window.location.reload();
        }).catch(errorInfo => {
            console.log('表单验证失败:', errorInfo);
        });
    }

    // 打开/关闭地址 抽屉
    const [OpenDrawer, setOpenDrawer] = useState(false);
    const DrawerModal = (bool) => {
        setOpenDrawer(bool);
    };

    // 地址选择(省)
    const [selectedProvince, setSelectedProvince] = useState('');
    const [Province, setProvince] = useState(true);
    const ProvinceClick = () => {
        setCity(false);
        setDistrict(false);
        setProvince(true);
    };
    const SelectedProvince = (Province_Label) => {
        setSelectedProvince(Province_Label)
        setProvince(false);
        setCity(true);
    }
    // 地址选择(市)
    const [selectedCity, setSelectedCity] = useState('');
    const [City, setCity] = useState(false);
    const CityClick = () => {
        setProvince(false);
        setDistrict(false);
        setCity(true);
    };
    const SelectedCity = (City_Label) => {
        setSelectedCity(City_Label)
        setCity(false);
        setDistrict(true);
    }
    // 地址选择(区)
    const [selectedDistrict, setSelectedDistrict] = useState('');
    const [District, setDistrict] = useState(false);
    const DistrictClick = () => {
        setProvince(false);
        setCity(false);
        setDistrict(true);
    };
    const SelectedDistrict = (District_Label) => {
        setSelectedDistrict(District_Label)
        const selectedArea = `${selectedProvince || ''}${selectedCity ? '-' + selectedCity : ''}${District_Label ? '-' + District_Label : ''}`
        form.setFieldsValue({drawer: selectedArea})
        DrawerModal(false)
    }

    return (<>
        <div className={S.body}>
            {/*头部*/}
            <div className={S.TopHeader}>
                <div className={S.CartHeader}>
                    <div className={S.Logo}>
                        <Link to="/">
                            <img src={clogo} alt=""/>
                        </Link>
                    </div>
                    <div className={S.CartHeaderContent}>
                        <p>我的地址</p>
                    </div>
                </div>
            </div>

            <div className={S.address}>
                {ShowAddresses ? (ShowAddresses.map((item) => (<div className={S.addressItem} key={item.id}>
                    <div className={S.itemProfile}>
                        <span>{item.name}&nbsp;,</span>
                        <span className={S.itemTelephone}>{item.phone}</span>
                        <span className={S.itemDelete} onClick={() => delectAddress(item.id)}>X</span>

                        <p>{item.address}</p>
                    </div>
                    <div className={S.itemButton}>
                        <div className={S.default}></div>
                        <div className={S.selectButton}>
                            <Button className={S.updateButton}
                                    onClick={() => UpdateAddressModal(true, item.id, item.name, item.phone)}
                                    type="primary">修改</Button>
                        </div>
                    </div>
                </div>))) : <div className={S.EmptyCart}>
                    {/* 此处的图片不能直接写路径，只能通过import的方式将它引入进来 */}
                    <img src={emptyCart} alt="" className={S.EmptyCartImg}/>
                    <div className={S.EmptyCartText1}>购物车竟然是空的！</div>
                    <div className={S.EmptyCartText2}>再忙，也要记得买点什么犒劳自己~</div>
                </div>}
                <Button className={S.addressButton} onClick={CreateAddressModal} type="primary">添加收货地址</Button>
            </div>
        </div>

        {/* 添加收货地址models虚拟栏 */}
        <Modal title="添加收货地址" centered={true} open={isCreateAddressModalOpen} onOk={CreateAddress}
               onCancel={() => CreateAddressModal(false)}>
            <Form form={form}>
                <Form.Item label="收货人:" name="addresses" style={{marginTop: '37px'}}
                           rules={[{required: true, message: '收货人不能为空'}]}>
                    <Input/>
                </Form.Item>
                <Form.Item label="电话:" name="telephone"
                           rules={[{required: true, message: '电话不能为空'}]}>
                    <Input/>
                </Form.Item>
                <Form.Item label="地区:" name="drawer" onClick={() => DrawerModal(true)}
                           rules={[{required: true, message: '地区不能为空'}]}>
                    <Input readOnly onClick={() => DrawerModal(true)} id="drawer-input"/>
                </Form.Item>
                <Form.Item label="详情地址（如：街道/小区/乡镇/村）:" name="details"
                           rules={[{required: true, message: '详情地址不能为空'}]}>
                    <Input/>
                </Form.Item>
            </Form>
        </Modal>

        {/* 修改收货地址models虚拟栏 */}
        <Modal title="修改收货地址" centered={true} open={isUpdateAddressModalOpen} onOk={UpdateAddress}
               onCancel={() => UpdateAddressModal(false)}>
            <Form form={form}>
                <Form.Item label="收货人:" name="addresses" style={{marginTop: '37px'}}
                           rules={[{required: true, message: '收货人不能为空'}]}>
                    <Input/>
                </Form.Item>
                <Form.Item label="电话:" name="telephone"
                           rules={[{required: true, message: '电话不能为空'}]}>
                    <Input/>
                </Form.Item>
                <Form.Item label="地区:" name="drawer" onClick={() => DrawerModal(true)}
                           rules={[{required: true, message: '地区不能为空'}]}>
                    <Input readOnly onClick={() => DrawerModal(true)} id="drawer-input"/>
                </Form.Item>
                <Form.Item label="详情地址（如：街道/小区/乡镇/村）:" name="details"
                           rules={[{required: true, message: '详情地址不能为空'}]}>
                    <Input/>
                </Form.Item>
            </Form>
        </Modal>

        {/* 选择抽屉地址栏 */}
        <Drawer
            placement={"bottom"}
            closable={false}
            onClose={() => DrawerModal(false)}
            open={OpenDrawer}
            key={"bottom"}
        >
            <div className={S.DrawerHeader}>
                <span onClick={() => ProvinceClick(selectedProvince)}>
                    {selectedProvince ? selectedProvince : '请选择'}
                </span>
                <span onClick={() => CityClick(selectedCity)}>
                    {selectedCity ? selectedCity : '请选择'}
                </span>
                <span onClick={() => DistrictClick(selectedDistrict)}>
                    {selectedDistrict ? selectedDistrict : '请选择'}
                </span>
            </div>
            <div>
                {Province && (<div>
                    {cityData.map(province => (<p key={province.value} onClick={() => SelectedProvince(province.label)}>
                        {province.label}
                    </p>))}
                </div>)}
                {City && (<div>
                    {selectedProvince && cityData.find(province => province.label === selectedProvince)
                        .children.map(city => (
                            <p key={city.value} onClick={() => SelectedCity(city.label)}>{city.label}</p>))}
                </div>)}
                {District && (<div>
                    {selectedCity && cityData.find(province => province.label === selectedProvince)
                        .children.find(city => city.label === selectedCity)
                        .children.map(district => (<p key={district.value}
                                                      onClick={() => SelectedDistrict(district.label)}>{district.label}</p>))}
                </div>)}
            </div>
        </Drawer>
    </>)
}