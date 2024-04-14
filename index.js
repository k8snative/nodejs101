var express = require('express')
var app = express()

app.set('port', (process.env.PORT || 5001))
app.use(express.static(__dirname + '/public'))

app.get('/', function(request, response) {
  response.send('Deployed via Jenkins pipeline on AWS ec2 instance, for uat. 2nd try')
})

app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'))
})
