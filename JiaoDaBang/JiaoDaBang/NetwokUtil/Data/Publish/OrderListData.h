//
//  OrderListData.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderListData : NSObject

@property (nonatomic, strong) NSArray *listDataArray;

@end

@interface OrderInfoData : NSObject

@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *orderType;
@property (nonatomic, copy) NSString *mainType;
@property (nonatomic, copy) NSString *releaseAvatar;
@property (nonatomic, copy) NSString *releaseUserName;
@property (nonatomic, copy) NSString *releaseSex;
@property (nonatomic, copy) NSString *releaseNickName;
@property (nonatomic, copy) NSString *releaseSchool;
@property (nonatomic, copy) NSString *srcId;
@property (nonatomic, copy) NSString *srcDetail;
@property (nonatomic, copy) NSString *desId;
@property (nonatomic, copy) NSString *desDetail;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *stateId;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *acceptUserName;
@property (nonatomic, copy) NSString *acceptSex;
@property (nonatomic, copy) NSString *acceptNickName;
@property (nonatomic, copy) NSString *acceptAvatar;

@end
