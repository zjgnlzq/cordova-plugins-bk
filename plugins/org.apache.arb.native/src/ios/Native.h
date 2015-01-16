/********* Native.h Cordova Plugin Header *******/

#import <Cordova/CDV.h>

@interface Native : CDVPlugin
- (void)native:(CDVInvokedUrlCommand*)command;
@end
