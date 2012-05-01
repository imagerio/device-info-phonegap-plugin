//
//  DeviceInfoPlugin.m
//  DeviceInfoPhonegapPlugin
//
//  Created by Nadav Greenberg on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CDVDeviceInfo.h"
#import "NICInfoSummary.h"
#import <CommonCrypto/CommonDigest.h>

@interface CDVDeviceInfo (Private)
- (NSString *)sha1:(NSString*)origData;
@end

@implementation CDVDeviceInfo

@synthesize callbackID;

- (void) getDeviceInfo:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    NSLog(@"getDeviceInfo native");
    self.callbackID = [arguments pop];
    
    NICInfoSummary* summary = [[[NICInfoSummary alloc] init] autorelease];
    
    // en0 is for WiFi 
    NICInfo* wifi_info = [summary findNICInfo:@"en0"];
    NSLog(@"wifi macAddress: %@", wifi_info.macAddress);

    NSString* result = @"";
    if (wifi_info.macAddress) {
        result = wifi_info.macAddress;
    }
    
    if (![result isEqualToString:@""]) {
        // Get the string that javascript sent us 
        NSString *shouldSHA1 = [arguments objectAtIndex:0]; 
        if ([shouldSHA1 isEqualToString:@"true"]) {
            NSLog(@"doing sha1");
            result = [self sha1:result];
        }
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
}

- (NSString *)sha1:(NSString*)origData
{
    NSData *data = [origData dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
