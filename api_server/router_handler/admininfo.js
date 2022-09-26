const db = require('../db/index')
const bcrypt = require('bcryptjs')

exports.getAdminInfo = (req, res) => {
    let sql = `select * from administrator_tb where isdelete=0 `
    var url = req.url

    if (url.indexOf('?') != -1) {
        var params = url.split('?')
        var param = params[1].split('=')
        var adname = param[1]
    }

    if (adname !== null & adname != '' & adname !== undefined) {
        sql = sql.concat(`and adname like '%${adname}%'`)
    }
    db.query(sql, adname, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            status: 0,
            message: '用户成功！',
            data: results
        })
    })
}

exports.updateAdInfo = (req, res) => {
    const sql = `update administrator_tb set ? where id=?`
    db.query(sql, [req.body, req.body.id], (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('更新用户的基本信息失败！')
        res.cc('更新用户信息成功', 0)
    })
}

exports.addAdmin = (req, res) => {
    const adinfo = req.body
    const sql = `select * from administrator_tb where adname=?`
    db.query(sql, adinfo.adname, (err, results) => {
        if (err) return res.cc(err)

        for (let index = 0; index < results.length; index++) {
            const element = results[index].adname;
            if (element === adinfo.adname) return res.cc('当前管理员账号已存在，请更换后重试！')
        }

        // 密码加密
        adinfo.adpassword = bcrypt.hashSync(adinfo.adpassword, 10)
        const sql = `insert into administrator_tb set ?`
        db.query(sql, adinfo, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('新增管理员失败！')
            res.cc('新增管理员成功！', 0)
        })
    })
}

exports.deleteAdmId = (req, res) => {
    const sql = `update administrator_tb set isdelete=1 where id=?`

    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('删除管理员失败！')
        res.cc('删除管理员成功！', 0)
    })
}

exports.getAdInfoById = (req, res) => {
    const sql = `select * from administrator_tb where id=?`
    db.query(sql, req.params.id, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('获取账户信息失败')
        res.send({
            status: 0,
            message: '获取账户信息成功',
            data: results[0]
        })
    })
}

exports.updateAdmById = (req, res) => {
    const upadinfo = req.body
        // console.log(upadinfo);
    const sql = `select * from administrator_tb where id<>? and adname=?`
    db.query(sql, [upadinfo.id, upadinfo.adname], (err, results) => {
        if (err) return res.cc(err)
        for (let index = 0; index < results.length; index++) {
            const element = results[index].adname;
            if (element === upadinfo.adname) { return res.cc('该账号名被占用，请更换后重试！') }
        }
        const sql = `update administrator_tb set ? where id=?`
        db.query(sql, [req.body, req.body.id], (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('更新账号失败！')
            res.cc('更新账号名称成功！', 0)
        })
    })
}