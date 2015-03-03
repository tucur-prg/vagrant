//
// Web Server
//  npm install ejs
//

/**
 * Stop: Ctrl + C
 */
var http = require('http'),
    fs = require('fs'),
    ejs = require('ejs'),
    qs = require('querystring');

var settings = require('./configs/settings');

var template = fs.readFileSync(__dirname + '/templates/form.ejs', 'utf-8'); // blocking
var posts = [];

var server = http.createServer();
server.on('request', function (req, res) {
    if (req.method === 'POST') {
        req.data = "";

        req.on('readable', function () {
            req.data += req.read();
        });

        req.on('end', function () {
            var query = qs.parse(req.data);
            posts.push(query.name);
            renderForm(posts, res);
        });
    } else {
        renderForm(posts, res);
    }
});

server.listen(settings.port, settings.host);

console.log("server listening ...");

function renderForm(posts, res) {
    var data = ejs.render(template, {
        posts: posts,
    });

    res.writeHead(200, {
        'Content-Type': 'text/html',
    });
    res.write(data);
    res.end();
}
