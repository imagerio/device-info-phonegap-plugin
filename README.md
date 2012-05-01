iOS Cordova\Phonegap plugin for getting device id
It uses the excellent NICInfo library by kenial (https://bitbucket.org/kenial/nicinfo)

It retrieved the NICInfo of the 3G and falls back to Wifi. 
Returns empty string if non are present
It defaults to returning the info as SHA1, Base64 for privacy, but that is controllable by params.

The example folder has a working demo, built on Cordova 1.6.1