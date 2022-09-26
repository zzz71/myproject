const joi = require('joi')

const user_nickname = joi.string().alphanum().min(1).max(10).required()
const user_password = joi.string().pattern(/^[\S]{6,12}$/).required()
exports.reg_reg_schema = {
    body: {
        user_nickname,
        user_password
    }
}