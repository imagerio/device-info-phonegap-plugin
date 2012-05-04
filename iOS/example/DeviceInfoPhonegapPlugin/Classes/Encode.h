//
//  Encode.h
//  DeviceInfoPhonegapPlugin
//
//  Created by Nadav Greenberg on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encode : NSObject {
    
}

+ (NSString *)encodeBase64WithString:(NSString *)strData;
+ (NSString *)encodeBase64WithData:(NSData *)objData;


@end

