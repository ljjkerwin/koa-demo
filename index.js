const Koa = require('koa')
const app = new Koa()


const port = 3000
const text = process.argv[2]


app.use(async (ctx, next) => {
    const now = new Date()
    const result = `${now} ${text || ''}`
    console.log(result)
    ctx.body = result
})



app.listen(port, () => {
    console.log('listening on port', port)
})
