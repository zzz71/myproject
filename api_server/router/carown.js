// 车主信息
const express = require('express')
const router = express.Router()

const carown_handler = require('../router_handler/carown')
const expressJoi = require('@escook/express-joi')
const { delete_carown_schema } = require('../schema/carown')

// 获取
router.get('/carown', carown_handler.getCarOwn)

// 删除
router.get('/delecarown/:id', expressJoi(delete_carown_schema), carown_handler.deleteCarOwn)

module.exports = router