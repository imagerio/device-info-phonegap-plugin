//
//  DeviceInfoPlugin.h
//  DeviceInfoPhonegapPlugin
//
//  Created by Nadav Greenberg on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef CORDOVA_FRAMEWORK
#import <Cordova/CDVPlugin.h>
#else
#import "CDVPlugin.h"
#endif


@interface CDVDeviceInfo : CDVPlugin {
    NSString* callbackID; 
}

@property (nonatomic, copy) NSString* callbackID;

- (void) getDeviceInfo:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
