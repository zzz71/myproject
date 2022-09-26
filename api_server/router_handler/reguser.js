const db = require('../db/index')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const config = require('../config')

exports.regUser = (req, res) => {
    const reguser = req.body

    console.log(reguser);

    const sqlStr = 'select * from user_tb where user_nickname=?'
    db.query(sqlStr, reguser.user_nickname, (err, results) => {
        if (err) {
            // return res.send({ status: 1, message: err.message })
            return res.cc(err)
        }

        if (results.length > 0) {
            // return res.send({ status: 1, message: '用户名被占用，请更换其他用户名！' })
            return res.cc('用户名被占用，请更换其他用户名！')
        }

        // 密码加密
        reguser.user_password = bcrypt.hashSync(reguser.user_password, 10)

        const sql = 'insert into user_tb set ?'
        db.query(sql, { user_nickname: reguser.user_nickname, user_password: reguser.user_password }, (err, results) => {
            if (err) return res.cc(err)

            if (results.affectedRows !== 1) return res.cc('注册用户失败，请稍后重试！')

            // res.send({ status: 0, message: '注册成功！' })
            res.cc('注册成功', 0)
        })
    })
}