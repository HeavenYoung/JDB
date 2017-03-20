//
//  RaiseLabelListRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "RaiseLabelListRequest.h"
#import "RaiseLabelListResponse.h"

@implementation RaiseLabelListRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"appraiselabellist";
    }
    return self;
}

- (void)parametersWithProperties {

}

ResponserParserGenerate(RaiseLabelListResponse)

@end
