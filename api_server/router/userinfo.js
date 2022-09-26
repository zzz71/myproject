// 用户信息
const express = require('express')
const router = express.Router()

const expressJoi = require('@escook/express-joi')
const userinfo_handler = require('../router_handler/userinfo')
const { delete_usinfo_schema } = require('../schema/userinfo')

// 获取
router.get('/userinfo', userinfo_handler.getUserinfo)

// 删除
router.get('/deleuser/:id', expressJoi(delete_usinfo_schema), userinfo_handler.deleteUser)


module.exports = router