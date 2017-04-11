//
//  PosNumData.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/12.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PosNumListData : NSObject

@property (nonatomic , strong) NSArray *posNumDataArray;
@property (nonatomic , copy) NSString *info;
@property (nonatomic , assign) NSInteger count;

@end

@interface PosNumData : NSObject

@property (nonatomic , copy) NSString *srcId;
@property (nonatomic , copy) NSString *blockId;
@property (nonatomic , copy) NSString *count;
@property (nonatomic , copy) NSString *lng;
@property (nonatomic , copy) NSString *lat;

@end
