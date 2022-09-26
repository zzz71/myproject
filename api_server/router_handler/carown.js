const db = require('../db/index')

exports.getCarOwn = (req, res) => {
    let sql = `select * from carmaster where isdelete=0 `
    var url = req.url

    console.log(url);

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')
        var name = decodeURI(param[1])
    }
    if (name != null & name != '' & name !== undefined) {
        sql = sql.concat(`and name like '%${name}%'`)
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

exports.deleteCarOwn = (req, res) => {
    const sql = `update carmaster set isdelete=1 where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc('删除车主失败！')
        res.cc('删除车主成功！', 0)
    })
}