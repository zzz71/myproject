// 登陆注册
const express = require('express')
const router = express.Router()

// 用户路由处理函数模块
const user_handler = require('../router_handler/user')

// 验证数据中间件
const expressJoi = require('@escook/express-joi')
const { reg_login_schema } = require('../schema/user')

// 注册
router.post('/reguser', expressJoi(reg_login_schema), user_handler.regUser)

//登录 
router.post('/login', expressJoi(reg_login_schema), user_handler.login)

module.exports = router