// 停车场信息
const express = require('express')
const router = express.Router()

const parklocation_handler = require('../router_handler/parklocation')
const expressJoi = require('@escook/express-joi')
const { delete_parklocation_schema, add_locinfo_schema, get_parklocation_schema, update_locinfo_schema } = require('../schema/parklocation')

// 获取
router.get('/parklocation', parklocation_handler.getParkLoc)

// 删除
router.get('/deleparklocation/:id', expressJoi(delete_parklocation_schema), parklocation_handler.deleteParkLoc)

// 增加
router.post('/addparklock', expressJoi(add_locinfo_schema), parklocation_handler.addParkLoc)

// 根据 id 获取信息
router.get('/parklocation/:id', expressJoi(get_parklocation_schema), parklocation_handler.getLocInfoById)

// 根据 id 更新信息
router.post('/updateparkloc', parklocation_handler.updateLocById)

module.exports = router