//
//  NewsListRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "NewsListRequest.h"
#import "NewsListResponse.h"

@implementation NewsListRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"newslist";
    }
    return self;
}

- (void)parametersWithProperties {

}

ResponserParserGenerate(NewsListResponse)

@end
