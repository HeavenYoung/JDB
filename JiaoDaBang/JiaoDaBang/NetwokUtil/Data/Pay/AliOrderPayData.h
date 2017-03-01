//
//  AliOrderPayData.h
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AliOrderPayData : NSObject

@property (nonatomic, strong) NSString *orderStr;
@property (nonatomic, strong) NSString *callbackUrl;

@end
