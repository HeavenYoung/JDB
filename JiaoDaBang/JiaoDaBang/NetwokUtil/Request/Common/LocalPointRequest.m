//
//  LocalPointRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "LocalPointRequest.h"
#import "LocalPointResponse.h"

@implementation LocalPointRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.URLString = @"poslist";
    }
    return self;
}

- (void)parametersWithProperties {
    
}

ResponserParserGenerate(LocalPointResponse)

@end
