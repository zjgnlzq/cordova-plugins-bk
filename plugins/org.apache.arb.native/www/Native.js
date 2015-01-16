var exec = require('cordova/exec');

exports.native = function(arg0, success, error) {
    exec(success, error, "Native", "native", [arg0]);
};
