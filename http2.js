var http = require("http"); 
 var url = require("url"); 

 http.createServer(function (req, res) { 
    console.log(new Date().getTime() + ": " + req.url);
    var urlObj = url.parse(req.url, true); // 获取被代理的 URL 
    var urlToProxy = urlObj.query.url; 
    console.log("proxy url: " + urlToProxy);
    if (!urlToProxy) { 
        res.statusCode = 400; 
        res.end("URL 是必须的。"); 
    } 
    else { 
        console.log("处理代理请求：" + urlToProxy); 
        var parsedUrl = url.parse(urlToProxy); 
        var opt = { 
            host : parsedUrl.hostname, 
            port : parsedUrl.port || 80, 
            path : (parsedUrl.pathname || "") + (parsedUrl.search || "") 
                + (parsedUrl.hash || "") 
        }; 
        http.get(opt, function(pres) { // 请求被代理 URL 的内容
            res.statusCode = pres.statusCode; 
            var headers = pres.headers; 
            for (var key in headers) { 
                res.setHeader(key, headers[key]); 
            } 
            pres.on("data", function(chunk) { 
                res.write(chunk); // 写回数据
            }); 
            pres.on("end", function() { 
                res.end(); 
            }); 
        }); 
    } 
 }).listen(8088, "127.0.0.1"); 

 console.log("代理服务器已经在 8088 端口启动。");
