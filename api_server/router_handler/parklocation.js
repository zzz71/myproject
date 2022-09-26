const db = require('../db/index')

exports.getParkLoc = (req, res) => {
    let sql = `select * from parking_space where isdelete=0 `
    var url = req.url

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')
        var parkID = decodeURI(param[1])
    }

    if (parkID != null & parkID != '' & parkID !== undefined) {
        sql = sql.concat(`and parkID like '%${parkID}%'`)
    }

    db.query(sql, parkID, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取数据成功！',
            data: results
        })
    })
}

exports.deleteParkLoc = (req, res) => {
    const sql = `update parking_space set isdelete=1 where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc('删除停车位失败！')
        res.cc('删除停车位成功！', 0)
    })
}

exports.addParkLoc = (req, res) => {
    const painfo = req.body
    const sql = `select * from parking_space where parkID=?`
    db.query(sql, painfo.parkID, (err, results) => {
        if (err) return res.cc(err)

        for (let index = 0; index < results.length; index++) {
            const element = results[index].parkID;
            if (element === painfo.parkID) return res.cc('当前车位锁已存在，请更换后重试！')
        }
        const sql = `insert into parking_space set ? `
        db.query(sql, painfo, (err, results) => {
            if (err) return res.cc(err)
                // 密码加密
                // painfo.lock_pass = bcrypt.hashSync(painfo.lock_pass, 10)
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('新增车位锁失败！')
            res.cc('新增车位锁成功！', 0)
        })
    })
}

exports.getLocInfoById = (req, res) => {
    const sql = `select * from parking_space where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('获取停车位信息失败')
        res.send({
            status: 0,
            message: '获取停车位信息成功',
            data: results[0]
        })
    })
}

exports.updateLocById = (req, res) => {
    const uplocinfo = req.body
    console.log(uplocinfo);
    const sql = `select * from parking_space where id<>? and parkID=?`
    db.query(sql, [uplocinfo.id, uplocinfo.parkID], (err, results) => {
        if (err) return res.cc(err)
        for (let index = 0; index < results.length; index++) {
            const element = results[index].parkID;
            if (element === uplocinfo.parkID) { return res.cc('该停车位已存在，请更换后重试！') }
        }
        const sql = `update parking_space set ? where id=?`
        db.query(sql, [req.body, req.body.id], (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('更新停车位失败！')
            res.send({
                status: 0,
                message: '更新停车位成功！',
                data: req.body
            })
        })
    })
}