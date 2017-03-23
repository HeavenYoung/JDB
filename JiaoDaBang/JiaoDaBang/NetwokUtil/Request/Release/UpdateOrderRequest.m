//
//  UpdateOrderRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UpdateOrderRequest.h"
#import "UpdateOrderResponse.h"

@interface UpdateOrderRequest()

@property (nonatomic, copy) NSString *releaseuserId;
@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *orderType;
@property (nonatomic, copy) NSString *orderTypeName;
@property (nonatomic, copy) NSString *srcId;
@property (nonatomic, copy) NSString *srcDetail;
@property (nonatomic, copy) NSString *desId;
@property (nonatomic, copy) NSString *desDetail;
@property (nonatomic, copy) NSString *remark;

@end

@implementation UpdateOrderRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"updateorder";
        self.httpMethod = @"POST";
    }
    return self;
}

-(void) setParametersWithReleasedUserId:(NSString *)releaseuserId orderId:(NSString *)orderId orderType:(NSString *)orderType orderTypeName:(NSString *)orderTypeName srcId:(NSString *)srcId srcDetail:(NSString *)srcDetail desId:(NSString *)desId desDetail:(NSString *)desDetail remark:(NSString *)remark {
    
    self.releaseuserId = releaseuserId;
    self.orderId = orderId;
    self.orderType = orderType;
    self.orderTypeName = orderTypeName;
    self.srcId = srcId;
    self.srcDetail = srcDetail;
    self.desId = desId;
    self.desDetail = desDetail;
    self.remark = remark;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.releaseuserId] forKey:@"releaseuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.orderId] forKey:@"orderid"];
    [mDic setObject:[Tools encryptWithPlainText:self.orderType] forKey:@"ordertype"];
    [mDic setObject:[Tools encryptWithPlainText:self.orderTypeName] forKey:@"ordertypename"];
    [mDic setObject:[Tools encryptWithPlainText:self.srcId] forKey:@"srcid"];
    [mDic setObject:[Tools encryptWithPlainText:self.desId] forKey:@"desid"];
    [mDic setObject:[Tools encryptWithPlainText:self.srcDetail] forKey:@"srcdetail"];
    [mDic setObject:[Tools encryptWithPlainText:self.desDetail] forKey:@"desdetail"];
    [mDic setObject:[Tools encryptWithPlainText:self.remark] forKey:@"remark"];
    
    self.parameters = mDic;
    
}

ResponserParserGenerate(UpdateOrderResponse)


@end
