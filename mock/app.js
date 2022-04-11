const http = require('http')
const express = require('express')


const hostname = 'localhost'
const port = 3333

const app = express()


app.post('/user/login', (req, res) => {
  res.json({
    code: 0,
    data: {
      token: 'fjdaklfdjlajfsl',
      userName: "ibm"
    }
  })

})


app.listen(port, _ => {
  console.log(`Server running at http://${hostname}:${port}/`)
})