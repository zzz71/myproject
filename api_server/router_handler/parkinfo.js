const db = require('../db/index')

exports.getParkInfo = (req, res) => {
    let sql = `select * from parking where isdelete=0 `
    var url = req.url

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')
        var parkId = param[1]
    }

    console.log(parkId);

    if (parkId != null & parkId != '' & parkId !== undefined) {
        sql = sql.concat(`and parkId like '%${parkId}%'`)
    }

    db.query(sql, parkId, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取数据成功！',
            data: results
        })
    })
}

exports.deleteParkInfo = (req, res) => {
    const sql = `update parking set isdelete=1 where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc('删除车主失败！')
        res.cc('删除车主成功！', 0)
    })
}

exports.addPark = (req, res) => {
    const parkinfo = req.body
    const sql = `select * from parking where parkId=?`
    db.query(sql, parkinfo.parkId, (err, results) => {
        if (err) return res.cc(err)
        for (let index = 0; index < results.length; index++) {
            const element = results[index].parkId;
            if (element === parkinfo.parkId) return res.cc('当前停车位已存在，请更换后重试！')
        }

        const sql = `insert into parking set ?`
        db.query(sql, parkinfo, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('新增停车位失败！')
            res.cc('新增停车位成功！', 0)
        })
    })
}

exports.getPaInfoById = (req, res) => {
    const sql = `select * from parking where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('获取停车场信息失败')
        res.send({
            status: 0,
            message: '获取停车场信息成功',
            data: results[0]
        })
    })
}

exports.updatePaById = (req, res) => {
    const uppainfo = req.body
    const sql = `select * from parking where id<>? and parkId=?`
    db.query(sql, [uppainfo.id, uppainfo.parkId], (err, results) => {
        if (err) return res.cc(err)
        for (let index = 0; index < results.length; index++) {
            const element = results[index].parkId;
            if (element === uppainfo.parkId) return res.cc('当前停车位已存在，请更换后重试！')
        }

        const sql = `update parking set ? where id=?`
        db.query(sql, [req.body, req.body.id], (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('更新停车场信息失败！')
            res.cc('更新停车场信息成功！', 0)
        })
    })
}