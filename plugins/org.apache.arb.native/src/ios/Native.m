/********* Native.m Cordova Plugin Implementation *******/

#import "Native.h"
#import "SQLiteManager.h"
#import <Cordova/CDV.h>

@implementation Native

- (void)native:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSArray *result_arr = nil;
    NSString* operation = [command.arguments objectAtIndex:0];
    if (operation != nil && [operation length] > 0) {
        if ( [operation isEqualToString:@"DB"] ) {
            NSString *dbName=[command.arguments objectAtIndex:1];
            NSString *sql=[command.arguments objectAtIndex:2];
            NSLog(@"database : %@",dbName);
            NSLog(@"sql : %@",sql);
            id dbManager = [[SQLiteManager alloc] initWithDatabaseNamed:dbName];
            NSLog(@"DB address :%@",[dbManager getDatabasePath]);
            result_arr=[dbManager getRowsForQuery:sql];
            NSLog(@"Result :%@",result_arr);
            if ([[result_arr objectAtIndex:0] isEqualToNumber:[NSNumber numberWithInt:1]]) {
                //error
                NSString * result = [[result_arr valueForKey:@"description"] componentsJoinedByString:@""];
                result_arr = [NSArray arrayWithObject:result];
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsArray:result_arr];
            }else
            {
                if ([[result_arr objectAtIndex:1] count ] == 0) {
                    //result_arr =[NSArray arrayWithObjects:@"ok", nil];
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray: nil];
                }else
                {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:[result_arr objectAtIndex:1]];
                }
            }
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end