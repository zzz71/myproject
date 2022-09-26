const joi = require('joi')

const id = joi.number().integer().min(1).required()
const parkAdd = joi.required()
const park_state = joi.required()
const lock_pass = joi.string().pattern(/^[\S]{6,12}$/).required()
const note = joi.required()

exports.delete_parklocation_schema = {
    params: { id }
}

exports.get_parklocation_schema = {
    params: { id }
}

exports.add_locinfo_schema = {
    body: {
        parkID: id,
        parkAdd,
        park_state,
        lock_pass,
        note
    }
}

exports.update_locinfo_schema = {
    // body: {
    //     id,
    //     parkID: id,
    //     parkAdd,
    //     park_state,
    //     lock_pass,
    //     note
    // }
}