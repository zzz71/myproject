const db = require('../db/index')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const config = require('../config')

exports.regUser = (req, res) => {
    const admininfo = req.body

    console.log(admininfo);
    // if (!admininfo.adname || !admininfo.adpassword) {
    //     return res.send({ status: 1, message: '用户名或密码不合法' })
    // }

    const sqlStr = 'select * from administrator_tb where adname=?'
    db.query(sqlStr, admininfo.adname, (err, results) => {
        if (err) {
            // return res.send({ status: 1, message: err.message })
            return res.cc(err)
        }

        if (results.length > 0) {
            // return res.send({ status: 1, message: '用户名被占用，请更换其他用户名！' })
            return res.cc('用户名被占用，请更换其他用户名！')
        }

        // 密码加密
        admininfo.adpassword = bcrypt.hashSync(admininfo.adpassword, 10)

        const sql = 'insert into administrator_tb set ?'
        db.query(sql, { adname: admininfo.adname, adpassword: admininfo.adpassword }, (err, results) => {
            if (err) return res.cc(err)

            if (results.affectedRows !== 1) return res.cc('注册用户失败，请稍后重试！')

            // res.send({ status: 0, message: '注册成功！' })
            res.cc('注册成功', 0)
        })
    })
}

exports.login = (req, res) => {
    const admininfo = req.body

    const sql = `select * from administrator_tb where adname=?`

    db.query(sql, admininfo.adname, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('登录失败！')

        const compareResult = bcrypt.compareSync(admininfo.adpassword, results[0].adpassword)
        if (!compareResult) return res.cc('登录失败！')

        const admin = {...results[0], adpassword: '' }
        const tokenStr = jwt.sign(admin, config.jwtSecreKey, { expiresIn: config.expiresIn })
        res.send({
            status: 0,
            message: '登录成功！',
            token: 'Bearer ' + tokenStr
        })
    })
}