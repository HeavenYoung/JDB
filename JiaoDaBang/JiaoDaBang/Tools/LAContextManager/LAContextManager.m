//
//  LAContextManager.m
//  LAContextManager
//
//  Created by Heaven on 2016/11/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "LAContextManager.h"

@interface LAContextManager ()

@end

@implementation LAContextManager

+ (BOOL)checkLAContextSupported {
    
    LAContext *laContext = [[LAContext alloc] init];
    
    return [laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL];
    
}

+ (void)evaluateWithLocalizedReason:(NSString *)localizedReason reply:(void (^)(BOOL success, NSError *error))reply completion:(void (^)(void))completion {

    LAContext *laContext = [[LAContext alloc] init];
    [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:localizedReason reply:^(BOOL success, NSError * _Nullable error) {
        
        // success
        if (success) {
            
            NSLog(@"Touch ID evalua success");
            
            reply(success, nil);
            
            // do completion
            if (completion) {
                completion();
            }
        }
        
        if (error) {
            reply(NO, error);
        }

    }];
}

@end
