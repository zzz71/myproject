const db = require('../db/index')

// 获取用户信息
exports.getUserinfo = (req, res) => {
    let sql = `select * from user_tb  where is_delete=0 `
    var url = req.url

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')

        var username = decodeURI(param[1])
    }

    if (username !== null && username !== '' & username !== undefined) {
        sql = sql.concat(`and user_name like '%${username}%'`)
        console.log(sql);
    }

    db.query(sql, username, (err, results) => {
        console.log(sql);
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '获取用户信息成功',
            data: results
        })
    })
}

exports.deleteUser = (req, res) => {
    const sql = `update user_tb set is_delete=1 where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc('删除用户失败！')
        res.cc('删除用户成功！', 0)
    })
}