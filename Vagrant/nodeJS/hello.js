var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello Node.js\n');
}).listen(3000);

console.log('Server running at http://192.168.33.30:3000/');
