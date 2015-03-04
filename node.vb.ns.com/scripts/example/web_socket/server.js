//
// Web Socket Server
//
var server = require('http').createServer(handler),
    io = require('socket.io').listen(server),
    fs = require('fs');

server.listen(1337);

// namespace
var chat = io.of('/chat').on('connection', function (socket) {
//io.sockets.on('connection', function (socket) {
    socket.on('emit_from_client', function (data) {
        // リクエストする範囲を指定する
        socket.join(data.room);
        socket.emit('emit_from_server', 'you are in ' + data.room);
        socket.broadcast.to(data.room).emit('emit_from_server', data.msg);

        // 接続しているソケットのみ
        socket.emit('emit_from_server', "socket.emit: " + data.msg);
        // 接続しているソケット以外全部
        socket.broadcast.emit('emit_from_server', "socket.broadcast.emit: " + data.msg);
        // 接続しているソケット全部
        io.sockets.emit('emit_from_server', "io.sockets.emit [" + socket.id + "]: " + data.msg);
    });
});

var news = io.of('/news').on('connection', function (socket) {
    socket.emit('emit_from_server', "today: " + new Date());
});

function handler(req, res) {
    fs.readFile(__dirname + '/templates/index.html', function (err, data) {
        if (err) {
            res.writeHead(500);
            return res.end('Error');
        }

        res.writeHead(200, {
            'Content-Type': 'text/html',
        });
        res.write(data);
        res.end();
    });
}

console.log("server listening ...");
