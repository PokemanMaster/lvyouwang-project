import * as React from "react";
import {useEffect, useState} from "react";
import {useNavigate} from "react-router-dom";
import S from "./index.module.css"
import {UserTokenAPI} from "../../api/users";
import {Form, Input, Button, Row, Col} from "antd";


export default function UserPass() {
    // 路由跳转定义
    const navigateTo = useNavigate()
    // 用户信息
    const [myInfo, setMyInfo] = useState(JSON.parse(localStorage.getItem("user")))
    const token = localStorage.getItem("token");

    useEffect(() => {
        setMyInfo(JSON.parse(localStorage.getItem("user")));
        // 获取用户信息
        UserTokenAPI(token).then(res => {
            if (res.msg === "ok") {
                setMyInfo(JSON.parse(localStorage.getItem("user")));
            }
        }).catch(err => {
            console.log(err)
        })
    }, [])

    const [form] = Form.useForm();
    const onFinish = (values) => {
        // Your logic for saving the form
    };

    return (
        <div className={S.UserPassContent}>
            <div className={S.Extra}></div>
            <div className={S.UserPassTitle}>
                <p>修改密码</p>
            </div>
            <div className={S.UserPassForm}>
                <Form
                    form={form}
                    name="user-details-form"
                    labelCol={{span: 8}}
                    wrapperCol={{span: 16}}
                    initialValues={{remember: true}}
                    onFinish={onFinish}
                    autoComplete="off"
                >

                    <Form.Item label="密码:" name="password"
                               rules={[{required: true, message: '请输入密码'}]}>
                        <Input/>
                    </Form.Item>


                    <Form.Item label="确认密码:" name="confirmPassword"
                               rules={[{required: true, message: '密码不一致'}]}>
                        <Input/>
                    </Form.Item>

                    <Form.Item>
                        <Button type="primary" htmlType="submit"
                                style={{marginBottom: '83px'}}>保存</Button>
                    </Form.Item>
                </Form>
            </div>
        </div>
    )
}