// httpモジュールをインポート
var http = require('http');

// Webサーバの設定
http.createServer(function(req, res){
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(3001);

console.log('Server running at http://localhost:3000/');
