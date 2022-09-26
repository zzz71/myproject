// 管理员信息

const express = require('express')
const router = express.Router()

const adinfo_handler = require('../router_handler/admininfo')

const expressJoi = require('@escook/express-joi')
const { update_adinfo_schema, add_adinfo_schema, delete_adinfo_schema, get_adinfo_schema, update_admfo_schema } = require('../schema/user')

// 获取信息
router.get('/admininfo', adinfo_handler.getAdminInfo)

// 更新信息
router.post('/admininfo', expressJoi(update_adinfo_schema), adinfo_handler.updateAdInfo)

// 新增信息
router.post('/addadmin', expressJoi(add_adinfo_schema), adinfo_handler.addAdmin)

// 根据 id 删除
router.get('/deleteadm/:id', expressJoi(delete_adinfo_schema), adinfo_handler.deleteAdmId)

// 根据 id 获取信息
router.get('/admininfo/:id', expressJoi(get_adinfo_schema), adinfo_handler.getAdInfoById)

// 根据 id 更新信息
router.post('/updateadm', expressJoi(update_admfo_schema), adinfo_handler.updateAdmById)

module.exports = router