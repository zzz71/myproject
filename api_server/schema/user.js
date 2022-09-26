// 导入验证规则的包
const joi = require('joi')

const adname = joi.string().alphanum().min(1).max(10).required()
const adpassword = joi.string().pattern(/^[\S]{6,12}$/).required()

const id = joi.number().integer().min(1).required()
const adrole = joi.required()

exports.reg_login_schema = {
    body: {
        adname,
        adpassword
    }
}

exports.update_adinfo_schema = {
    body: {
        id,
        adname,
        adpassword,
        adrole
    },
}

exports.add_adinfo_schema = {
    body: {
        adname,
        adpassword,
        adrole
    }
}

exports.delete_adinfo_schema = {
    params: { id }
}

exports.get_adinfo_schema = {
    params: { id }
}

exports.update_admfo_schema = {
    body: {
        id,
        adname,
        adrole
    },
}