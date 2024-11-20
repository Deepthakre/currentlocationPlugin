#import <Cordova/CDV.h>

@interface CurrentLocationPlugin : CDVPlugin
- (void)getCurrentLocation:(CDVInvokedUrlCommand*)command;
@end

@implementation CurrentLocationPlugin

- (void)getCurrentLocation:(CDVInvokedUrlCommand*)command {
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    CLLocation *location = [locationManager location];
    if (location) {
        NSString *locationString = [NSString stringWithFormat:@"%f,%f", location.coordinate.latitude, location.coordinate.longitude];
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:locationString];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Location not available"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}