//
//  OrderTypeRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "OrderTypeRequest.h"
#import "OrderTypeResponse.h"

@implementation OrderTypeRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.URLString = @"ordertypelist";
    }
    return self;
}

- (void)parametersWithProperties {

}

ResponserParserGenerate(OrderTypeResponse)

@end
