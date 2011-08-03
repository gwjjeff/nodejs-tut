var languages = { 
	"zh_CN" : "你好，", 
	"en" : "Hello, "
};      
exports.sayHello = function(name, language) { 
	return languages[language] || languages["en"] + name; 
};

// var greetings = require("./greetings.js"); 
//  var msg = greetings.sayHello("Alex", "zh_CN"); 
//   process.stdout.write(msg)
