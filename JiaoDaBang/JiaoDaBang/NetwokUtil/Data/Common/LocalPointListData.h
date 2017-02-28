//
//  LocalPointList.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalPointListData : NSObject

@property (nonatomic, strong) NSArray *localPointListArray;

@end

@interface LocalPointInfoData : NSObject

@property (nonatomic, copy) NSString *posId;
@property (nonatomic, copy) NSString *blockId;
@property (nonatomic, copy) NSString *posName;

@end
