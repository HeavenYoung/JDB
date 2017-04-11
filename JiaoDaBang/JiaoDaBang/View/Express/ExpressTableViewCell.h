//
//  ExpressTableViewCell.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExpressTableViewCellDelegate <NSObject>

- (void)sendExpress:(DeliveryInfoData *)deliveryInfoData;


@end

@interface ExpressTableViewCell : UITableViewCell

@property (nonatomic, strong) DeliveryInfoData *deliveryInfoData;

@property (nonatomic, weak) id <ExpressTableViewCellDelegate> delegate;

@end
