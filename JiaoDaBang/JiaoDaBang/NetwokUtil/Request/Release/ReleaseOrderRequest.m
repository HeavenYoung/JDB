//
//  ReleaseOrderRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ReleaseOrderRequest.h"
#import "ReleaseOrderResponse.h"

@interface ReleaseOrderRequest ()

@property (nonatomic, copy) NSString *releaseuserid;
@property (nonatomic, copy) NSString *ordertype;
@property (nonatomic, copy) NSString *ordertypename;
@property (nonatomic, copy) NSString *srcid;
@property (nonatomic, copy) NSString *srcdetail;
@property (nonatomic, copy) NSString *desid;
@property (nonatomic, copy) NSString *desdetail;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *maintype;
@property (nonatomic, copy) NSString *deliveryid;

@end

@implementation ReleaseOrderRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"release";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userId orderType:(NSString *)orderType orderTypeName:(NSString *)orderTypeName srcId:(NSString *)srcId srcDetail:(NSString *)srcDetail desId:(NSString *)desId desDetail:(NSString *)desDetail money:(NSString *)money remark:(NSString *)remark mainType:(NSString *)maintype deliveryId:(NSString *)deliveryId {

    self.releaseuserid = userId;
    self.ordertype = orderType;
    self.ordertypename = orderTypeName;
    self.srcid = srcId;
    self.srcdetail = srcDetail;
    self.desid = desId;
    self.desdetail = desDetail;
    self.money = money;
    self.remark = remark;
    self.maintype = maintype;
    self.deliveryid = self.deliveryid;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.releaseuserid] forKey:@"releaseuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.ordertype] forKey:@"ordertype"];
    [mDic setObject:[Tools encryptWithPlainText:self.ordertypename] forKey:@"ordertypename"];
    [mDic setObject:[Tools encryptWithPlainText:self.srcid] forKey:@"srcid"];
    [mDic setObject:[Tools encryptWithPlainText:self.srcdetail] forKey:@"srcdetail"];
    [mDic setObject:[Tools encryptWithPlainText:self.desid] forKey:@"desid"];
    [mDic setObject:[Tools encryptWithPlainText:self.desdetail] forKey:@"desdetail"];
    [mDic setObject:[Tools encryptWithPlainText:self.money] forKey:@"money"];
    [mDic setObject:[Tools encryptWithPlainText:self.remark] forKey:@"remark"];
    [mDic setObject:[Tools encryptWithPlainText:self.maintype] forKey:@"maintype"];
    [mDic setObject:[Tools encryptWithPlainText:self.deliveryid] forKey:@"deliveryid"];
  
    self.parameters = mDic;

}

ResponserParserGenerate(ReleaseOrderResponse)

@end
