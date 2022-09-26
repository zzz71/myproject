// 车辆信息
const express = require('express')
const router = express.Router()

const carinfo_handler = require('../router_handler/carinfo')
const expressJoi = require('@escook/express-joi')
const { delete_carinfo_schema } = require('../schema/carinfo')

// 获取
router.get('/carinfo', carinfo_handler.getCarInfo)

// 删除
router.get('/delecarinfo/:id', expressJoi(delete_carinfo_schema), carinfo_handler.deleteCarInfo)

module.exports = router