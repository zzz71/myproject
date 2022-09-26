const joi = require('joi')

const express = require('express')
const app = express()

//  配置 cors 跨域
const cors = require('cors')
app.use(cors())

app.use(express.urlencoded({ extended: false }))

//  封装 res.cc 函数中间件 用来优化 res.send
app.use((req, res, next) => {
    // status 默认值为1
    res.cc = function(err, status = 1) {
        res.send({
            status,
            message: err instanceof Error ? err.message : err
        })
    }
    next()
})

// 配置解析 Token 的中间件
const expressJWT = require('express-jwt')
const config = require('./config')

app.use(expressJWT({ secret: config.jwtSecreKey }).unless({ path: [/^\/api/] }))

// 用户登录路由模块
const reguserRouter = require('./router/reguser')
app.use('/api/us', reguserRouter)

// 用户登录路由模块
const userRouter = require('./router/user')
app.use('/api', userRouter)

// 管理员信息路由模块
const admininfoRouter = require('./router/admininfo')
app.use('/my', admininfoRouter)

// 用户信息模块
const userinfoRouter = require('./router/userinfo')
app.use('/own', userinfoRouter)

// 车主信息模块
const carownRouter = require('./router/carown')
app.use('/car', carownRouter)

// 车位锁信息模块
const carlockRouter = require('./router/carlock')
app.use('/carlock', carlockRouter)

// 车辆信息模块
const carinfoRouter = require('./router/carinfo')
app.use('/carinf', carinfoRouter)

// 停车场信息模块
const parkinfoRouter = require('./router/parkinfo')
app.use('/park', parkinfoRouter)

// 停车位信息模块
const parklocationRouter = require('./router/parklocation')
app.use('/parking', parklocationRouter)


app.use((err, req, res, next) => {
    // 验证失败导致的错误
    if (err instanceof joi.ValidationError) return res.cc(err)

    if (err.name === 'UnauthorizedError') return res.cc('身份认证失败')

    // 未知的错误
    res.cc(err)
})

app.listen(3007, () => {
    console.log('http://localhost:3007');
})