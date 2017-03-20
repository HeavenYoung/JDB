//
//  RaiseLabelListData.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RaiseLabelListData : NSObject

@property (nonatomic, strong) NSArray *dataListArray;

@end

@interface RaiseLabelData : NSObject

@property (nonatomic, copy) NSString *appraiselabelid;
@property (nonatomic, copy) NSString *appraiselevel;
@property (nonatomic, copy) NSString *appraiselabel;

@end
