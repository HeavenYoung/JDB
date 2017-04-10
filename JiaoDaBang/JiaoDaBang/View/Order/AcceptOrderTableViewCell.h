//
//  AcceptOrderTableViewCell.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AcceptOrderTableViewCellDelegate <NSObject>

- (void)confirmOrder:(OrderData *)orderData;

@end

@interface AcceptOrderTableViewCell : UITableViewCell

@property (nonatomic, strong) OrderData *orderData;

@property (nonatomic, weak) id <AcceptOrderTableViewCellDelegate> delegate;

@end
