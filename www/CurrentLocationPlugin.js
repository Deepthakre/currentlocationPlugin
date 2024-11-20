var exec = require('cordova/exec');

/**
 * Get the current location of the user.
 * @param {function} success - Callback for success with location data.
 * @param {function} error - Callback for handling errors.
 */
exports.getCurrentLocation = function (success, error) {
    exec(success, error, 'CurrentLocationPlugin', 'getCurrentLocation', []);
};
