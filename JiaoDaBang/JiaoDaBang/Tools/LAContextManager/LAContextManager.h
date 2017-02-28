//
//  LAContextManager.h
//  LAContextManager
//
//  Created by Heaven on 2016/11/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface LAContextManager : NSObject

/**
 Check Divice Touch ID Available

 @return BOOL
 */
+ (BOOL)checkLAContextSupported;

+ (void)evaluateWithLocalizedReason:(NSString *)localizedReason reply:(void(^)(BOOL success, NSError *error))reply completion:(void (^)(void))completion;

@end
