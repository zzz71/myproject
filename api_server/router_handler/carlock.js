const db = require('../db/index')

exports.getCarLock = (req, res) => {
    let sql = `select carm.id,carm.name,carm.tel,par.parkID from carmaster carm,parking_space par 
    where carm.carID=par.parkID and carm.isdelete=0 and par.isdelete=0 `

    var url = req.url

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')

        var name = decodeURI(param[1])
    }


    if (name != null & name != '') {
        sql = sql.concat(`and  carm.name like '%${name}%'`)
    }

    db.query(sql, name, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取数据成功！',
            data: results
        })
    })
}

exports.deleteCarLock = (req, res) => {
    const sql = `update carmaster set isdelete=1 where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc('删除车主失败！')
        res.cc('删除车主成功！', 0)
    })
}