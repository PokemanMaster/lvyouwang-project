import React, {lazy, useEffect} from 'react';
import {Navigate} from "react-router-dom";
import LayoutView from "../layout";
import {UserTokenAPI} from "../api/users";

const About = lazy(() => import("../views/About"));
const CallbackQQ = lazy(() => import("../views/CallbackQQ"));
const Cart = lazy(() => import("../views/Cart"));
const Center = lazy(() => import("../views/Center"));
const ConfirmOrder = lazy(() => import("../views/ConfirmOrder"));
const Details = lazy(() => import("../views/Details"));
const Favorite = lazy(() => import("../views/Favorite"));
const Goods = lazy(() => import("../views/Goods"));
const Home = lazy(() => import("../views/Home"));
const Login = lazy(() => import("../views/Login"));
const Order = lazy(() => import("../views/Order"));
const OrderDetails = lazy(() => import("../views/OrderDetails"));
const Register = lazy(() => import("../views/Register"));
const UserAddress = lazy(() => import("../views/UserAddress"));
const UserDetails = lazy(() => import("../views/UserDetails"));
const UserPass = lazy(() => import("../views/UserPass"));


// 懒加载组件加载时的 Loading 界面
const withLoadingComponent = (component) => (
    <React.Suspense fallback={<div>loading...</div>}>
        {component}
    </React.Suspense>
);

const router = [
    {
        path: "/",
        element: <Navigate to="/login"/>
    },
    {
        path: "/layout",
        element: <LayoutView/>,
        children: [
            {
                path: "home",
                element: withLoadingComponent(<Home/>)
            },
            {
                path: "goods",
                element: withLoadingComponent(<Goods/>)
            },
            {
                path: "personal",
                children: [
                    {
                        path: "center",
                        element: withLoadingComponent(<Center/>)
                    },
                    {
                        path: "favorite",
                        element: withLoadingComponent(<Favorite/>)
                    },
                    {
                        path: "order",
                        element: withLoadingComponent(<Order/>)
                    },
                    {
                        path: "cart",
                        element: withLoadingComponent(<Cart/>)
                    },
                ]
            },
            {
                path: "user",
                children: [
                    {
                        path: "details",
                        element: withLoadingComponent(<UserDetails/>)
                    },
                    {
                        path: "pass",
                        element: withLoadingComponent(<UserPass/>)
                    },
                    {
                        path: "address",
                        element: withLoadingComponent(<UserAddress/>)
                    },
                ]
            },
            {
                path: "about",
                element: withLoadingComponent(<About/>)
            },
            {
                path: "order/details/",
                element: withLoadingComponent(<OrderDetails/>)
            },
            {
                path: "order/confirm/:id",
                element: withLoadingComponent(<ConfirmOrder/>)
            },
            {
                path: "product/:id",
                element: withLoadingComponent(<Details/>)
            },
        ]
    },
    {
        path: "/register",
        element: withLoadingComponent(<Register/>)
    },
    {
        path: "/login",
        element: withLoadingComponent(<Login/>)
    },
    {
        path: "*",
        element: <Navigate to="/login"/>
    }
];


export default router;
