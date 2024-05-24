import S from './index.module.css'
import React, {useEffect, useState} from "react";
import {UpdateAPI} from "../../api/users";
import {Button, Form, Input, Upload, message} from "antd";
import {UploadOutlined} from "@ant-design/icons";

export default function UserDetails() {
    const [MyInfo, setMyInfo] = useState(JSON.parse(localStorage.getItem("user")))
    const [form] = Form.useForm();
    const UserId = JSON.parse(localStorage.getItem("user")).id

    // 展示用户信息
    useEffect(() => {
        setMyInfo(JSON.parse(localStorage.getItem("user")));
        form.setFieldsValue({nickname: nickName, username: userName});
    }, [setMyInfo])

    // 用户信息存储
    const [avatar, setAvatar] = useState(MyInfo.avatar);
    const [nickName, setNickName] = useState(MyInfo.nickname);
    const [userName, setUserName] = useState(MyInfo.user_name);

    // 提交修改
    const onFinish = (values) => {
        UpdateAPI({"id": UserId, "nickName": nickName, "user_name": userName, "avatar": avatar})
            .then(res => {
                success()
            }).catch(err => {
            console.log(err)
        })
    };

    // 修改头像
    const UpdateAvatar = ({file}) => {
        setAvatar(file.name)
    };

    // 提示消息
    const [messageApi, contextHolder] = message.useMessage();
    const success = () => {
        messageApi.open({
            type: 'success',
            content: '修改成功',
        }).then();
    };

    return (<div className={S.UserDetails}>
        <div className={S.UserDetailsContent}>
            <div className={S.Extra}></div>
            <div className={S.UserDetailsTitle}>
                <p>个人信息</p>
            </div>
            {contextHolder}
            <div className={S.UserDetailsForm}>
                <Form
                    form={form}
                    name="user-details-form"
                    labelCol={{span: 8}}
                    wrapperCol={{span: 16}}
                    initialValues={{remember: true}}
                    onFinish={onFinish}
                    autoComplete="off"
                >
                    <Form.Item label="头像:">
                        <Upload
                            listType="picture-card"
                            customRequest={UpdateAvatar}
                            showUploadList={false}
                        >
                            {avatar ? (<img src={avatar} alt="avatar" style={{width: '100%'}}/>) : (<div>
                                <UploadOutlined/>
                                <div>点击上传头像,只能上传png/jpg文件，且不超过2M</div>
                            </div>)}
                        </Upload>
                    </Form.Item>
                    <Form.Item label="昵称:" name="nickname"
                               rules={[{required: true, message: '请输入昵称'}]}>
                        <Input/>
                    </Form.Item>
                    <Form.Item label="用户名:" name="username"
                               rules={[{required: true, message: '请输入用户名'}]}>
                        <Input/>
                    </Form.Item>
                    <Form.Item wrapperCol={{offset: 8, span: 16}}>
                        <Button type="primary" htmlType="submit"
                                style={{marginBottom: '83px'}}>保存</Button>
                    </Form.Item>
                </Form>
            </div>
        </div>
    </div>)
}