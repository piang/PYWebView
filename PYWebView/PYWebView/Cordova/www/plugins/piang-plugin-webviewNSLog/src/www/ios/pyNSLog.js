cordova.define("piang-plugin.NSLog", function(require, exports, module) {


var pywebviewJS = {
    pyNSLog:function(message) {
        var paraArr = new Array();
        paraArr.push(message);
        var exec =cordova.require('cordova/exec');
        exec(function(){}, function(){},"PYCDVWebViewNSLog","pyNSLog",paraArr);
    }
};
               
module.exports = pywebviewJS;

});