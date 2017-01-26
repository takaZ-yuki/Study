var http = require('http');
var express = require('express');

var app = express();

app.get('/', function(req, res){
  res.send('Web Enginner Blog Express Sample');
});

http.createServer(app).listen(3000,function(){
  console.log('Express server started');
});
