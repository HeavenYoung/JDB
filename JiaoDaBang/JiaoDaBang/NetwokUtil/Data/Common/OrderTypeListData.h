//
//  OrderTypeListData.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderTypeListData : NSObject

@property (nonatomic, strong) NSArray *orderTypeListArray;

@end

@interface OrderTypeInfoData : NSObject

@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *orderType;

@end
