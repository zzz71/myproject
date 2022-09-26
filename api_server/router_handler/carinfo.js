const db = require('../db/index')

exports.getCarInfo = (req, res) => {
    let sql = `select cm.id,cm.name,c.carNum,c.age,c.note from carmaster cm, car c 
    where cm.carID=c.carID and c.isdelete=0 and cm.isdelete=0 `
    var url = req.url

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')

        var carNum = decodeURI(param[1])
    }

    if (carNum != null & carNum != '' & carNum !== undefined) {
        sql = sql.concat(`and carNum like '%${carNum}%'`)
    }

    db.query(sql, carNum, (err, results) => {
        console.log(sql);
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取数据成功！',
            data: results
        })
    })
}

exports.deleteCarInfo = (req, res) => {
    const sql = `update car set isdelete=1 where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc('删除车辆失败！')
        res.cc('删除车辆成功！', 0)
    })
}