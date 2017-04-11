//
//  PosNumRequest.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/12.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "PosNumRequest.h"
#import "PosNumResponse.h"


@implementation PosNumRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.URLString = @"getordernum";
    }
    return self;
}

- (void)parametersWithProperties {
    
}

ResponserParserGenerate(PosNumResponse)


@end
