const joi = require('joi')

const id = joi.number().integer().min(1).required()

exports.delete_usinfo_schema = {
    params: { id }
}