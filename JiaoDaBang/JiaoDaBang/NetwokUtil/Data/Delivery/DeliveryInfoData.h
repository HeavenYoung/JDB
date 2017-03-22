//
//  DeliveryInfoData.h
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeliveryListArrayData : NSObject

@property (nonatomic, strong) NSArray *deliveryInfoDataArray;

@end

@interface DeliveryInfoData : NSObject

@property (nonatomic, copy) NSString *deliveryid;
@property (nonatomic, copy) NSString *deliverytype;
@property (nonatomic, copy) NSString *phoneNum;
@property (nonatomic, copy) NSString *stateid;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *orderid;

@end

