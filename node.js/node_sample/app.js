var http = require('http');

http.createServer(function(req, res){
  var response_str = 'Hello ' + req.url + "\n";
  res.writeHead(200, {'Content-type': 'text/plain'});
  res.end(response_str);
}).listen(1337,'127.0.0.1');

console.log('Server running at http://:1337/');
