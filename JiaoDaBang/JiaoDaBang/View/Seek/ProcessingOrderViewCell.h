//
//  ProcessingOrderViewCell.h
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProcessingOrderViewCellDelegate <NSObject>

- (void)confirmOrder:(OrderData *)orderData;

- (void)chatWithUser:(OrderData *)orderData;

@end

@interface ProcessingOrderViewCell : UITableViewCell

@property (nonatomic, strong) OrderData *orderData;

@end
