(function() {

// get local ref to global PhoneGap/Cordova/cordova object for exec function
var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks

/**
 * Constructor
 */
function DeviceInfoPlugin()
{
}


DeviceInfoPlugin.prototype.getDeviceInfo = function(successCallback, failCallback, isSHA1)
{
    console.log('getDeviceInfo js called');
    var shouldSHA1 = (typeof isSHA1)==="undefined" ? true : isSHA1;
	cordovaRef.exec(function(result) {
			var final = result;
			successCallback(final);
		}, failCallback, "DeviceInfo", "getDeviceInfo", [shouldSHA1.toString()]);
    
}

/**
 * Install function
 */
DeviceInfoPlugin.install = function()
{
	if ( !window.plugins ) {
		window.plugins = {};
	} 
	if ( !window.plugins.DeviceInfoPlugin ) {
		window.plugins.DeviceInfoPlugin = new DeviceInfoPlugin();
	}
}

/**
 * Add to Cordova constructor
 */
if (cordovaRef && cordovaRef.addConstructor) {
	cordovaRef.addConstructor(DeviceInfoPlugin.install);
} else {
	console.log("DeviceInfo Cordova Plugin could not be installed.");
	return null;
}


})();
