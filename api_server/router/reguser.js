const express = require('express')
const router = express.Router()

// 用户路由处理函数模块
const reguser_handler = require('../router_handler/reguser')

// 验证数据中间件
const expressJoi = require('@escook/express-joi')
const { reg_reg_schema } = require('../schema/reguser')

// 注册
router.post('/reguser', expressJoi(reg_reg_schema), reguser_handler.regUser)

module.exports = router