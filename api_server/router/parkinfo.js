// 停车场信息
const express = require('express')
const router = express.Router()

const parkinfo_handler = require('../router_handler/parkinfo')
const expressJoi = require('@escook/express-joi')
const { delete_parkinfo_schema, get_parkinfo_schema, add_parkinfo_schema, update_parkinfo_schema } = require('../schema/parkinfo')

// 获取
router.get('/parkinfo', parkinfo_handler.getParkInfo)

// 删除
router.get('/deleparkinfo/:id', expressJoi(delete_parkinfo_schema), parkinfo_handler.deleteParkInfo)

//添加
router.post('/addpark', expressJoi(add_parkinfo_schema), parkinfo_handler.addPark)

// 根据 id 获取信息
router.get('/parkinfo/:id', expressJoi(get_parkinfo_schema), parkinfo_handler.getPaInfoById)

// 根据 id 更新信息
router.post('/updatepark', expressJoi(update_parkinfo_schema), parkinfo_handler.updatePaById)

module.exports = router