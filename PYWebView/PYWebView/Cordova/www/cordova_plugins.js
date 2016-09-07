cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "file": "plugins/cordova-plugin-wkwebview-engine/src/www/ios/ios-wkwebview-exec.js",
        "id": "cordova-plugin-wkwebview-engine.ios-wkwebview-exec",
        "pluginId": "cordova-plugin-wkwebview-engine",
        "clobbers": [
            "cordova.exec"
        ]
    },
    {
        "file": "plugins/piang-plugin-webviewNSLog/src/www/ios/pyNSLog.js",
        "id": "piang-plugin.NSLog",
        "pluginId": "piang-plugin",
        "clobbers": [
            "pywebviewJS"
        ]
    },

];
module.exports.metadata = 
// TOP OF METADATA
{}
// BOTTOM OF METADATA
});