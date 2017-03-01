//
//  PayObjc.h
//  MiTang_Client
//
//  Created by OTT on 16/5/26.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayObjc : NSObject

@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *orderName;
@property (nonatomic, copy) NSString *orderDetail;
@property (nonatomic, assign) NSNumber *fee;
@property (nonatomic, copy) NSString *userToken;
@property (nonatomic, copy) NSString *orderToken;
@property (nonatomic, copy) NSString *sellerId;
@property (nonatomic, copy) NSString *payMethod;
@property (nonatomic, copy) NSString *orderImageUrl;
@property (nonatomic, copy) NSString *orderType;
@property (nonatomic, copy) NSString *sellerMobile;



@end
