//
// Web Server
//  npm install ejs
//

/**
 * Stop: Ctrl + C
 */
var http = require('http'),
    fs = require('fs'),
    ejs = require('ejs');

var settings = require('./configs/settings');

var template = fs.readFileSync(__dirname + '/templates/hello.ejs', 'utf-8'); // blocking
var n = 0;

var server = http.createServer();
server.on('request', function (req, res) {
    n++;

    /**
     * エスケープあり：<%= foo %>
     * エスケープなし：<%- bar %>
     */
    var data = ejs.render(template, {
        title: "hello",
        content: "<strong>World</strong>",
        n: n,
    });

    res.writeHead(200, {
        'Content-Type': 'text/html',
    });
    res.write(data);
    res.end();
});

server.listen(settings.port, settings.host);

console.log("server listening ...");
