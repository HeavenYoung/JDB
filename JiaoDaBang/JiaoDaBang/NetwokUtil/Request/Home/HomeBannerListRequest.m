//
//  HomeBannerListRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "HomeBannerListRequest.h"
#import "HomeBannerListResponse.h"

@implementation HomeBannerListRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"bannerlist";
    }
}

- (void)parametersWithProperties {

    
}

ResponserParserGenerate(HomeBannerListResponse)

@end
