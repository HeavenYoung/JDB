//
//  BillData.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillListData : NSObject

@property (nonatomic , strong) NSArray *billDataArray;
@property (nonatomic , copy) NSString *info;
@property (nonatomic , assign) NSInteger count;

@end

@interface BillData : NSObject

@property (nonatomic , copy) NSString *billId;
@property (nonatomic , copy) NSString *userId;
@property (nonatomic , copy) NSString *userName;
@property (nonatomic , copy) NSString *money;
@property (nonatomic , copy) NSString *time;
@property (nonatomic , copy) NSString *orderId;
@property (nonatomic , copy) NSString *orderType;


@end
