var http = require('http');

var server = http.createServer(function(req, res) {
  res.writeHead(200);
  res.end('Hello Http 4');
});

server.listen(8080);
console.log('Running on http://localhost:' + 8080);