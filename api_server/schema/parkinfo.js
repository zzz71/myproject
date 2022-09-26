const joi = require('joi')

const id = joi.number().integer().min(1).required()
const carNum = joi.number().integer().min(1).required()
const latitudes = joi.number().min(1).required()
const longitudes = joi.number().min(1).required()
const parkingLocation = joi.required()
const note = joi.required()

exports.delete_parkinfo_schema = {
    params: { id }
}

exports.get_parkinfo_schema = {
    params: { id }
}

exports.add_parkinfo_schema = {
    body: {
        parkId: id,
        carNum,
        latitudes,
        longitudes,
        parkingLocation,
        note
    }
}

exports.update_parkinfo_schema = {
    body: {
        id,
        parkId: id,
        carNum,
        latitudes,
        longitudes,
        parkingLocation,
        note
    }
}