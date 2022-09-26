// 车位锁信息
const express = require('express')
const router = express.Router()

const carlock_handler = require('../router_handler/carlock')
const expressJoi = require('@escook/express-joi')
const { delete_carlock_schema } = require('../schema/carlock')

// 获取
router.get('/carlockinfo', carlock_handler.getCarLock)

// 删除
router.get('/delecarown/:id', expressJoi(delete_carlock_schema), carlock_handler.deleteCarLock)

module.exports = router