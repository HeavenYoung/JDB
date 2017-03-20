//
//  OrderData.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderListData : NSObject

@property (nonatomic, strong) NSArray *listDataArray;
@property (nonatomic, strong) NSString *orderCount;
@property (nonatomic, strong) NSString *orderInfo;

@end

@interface OrderData : NSObject

@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *orderType;
@property (nonatomic, copy) NSString *orderTypeName;
@property (nonatomic, copy) NSString *mainType;
@property (nonatomic, copy) NSString *releaseAvatar;
@property (nonatomic, copy) NSString *releaseUserName;
@property (nonatomic, copy) NSString *releaseSex;
@property (nonatomic, copy) NSString *releaseNickName;
@property (nonatomic, copy) NSString *releaseSchool;
@property (nonatomic, copy) NSString *srcId;
@property (nonatomic, copy) NSString *srcName;
@property (nonatomic, copy) NSString *srcDetail;
@property (nonatomic, copy) NSString *desId;
@property (nonatomic, copy) NSString *desName;
@property (nonatomic, copy) NSString *desDetail;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *payType;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *stateId;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *acceptUserName;
@property (nonatomic, copy) NSString *acceptNickName;
@property (nonatomic, copy) NSString *acceptSex;
@property (nonatomic, copy) NSString *acceptAvatar;
@property (nonatomic, copy) NSString *finishTime;

@end
