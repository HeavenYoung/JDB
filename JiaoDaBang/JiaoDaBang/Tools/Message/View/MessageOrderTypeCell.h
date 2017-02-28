//
//  MessageOrderTypeCell.h
//  MiTang_Client
//
//  Created by Heaven on 16/4/27.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageOrderTypeCellDelegate;

@interface MessageOrderTypeCell : UITableViewCell

@property(nonatomic, weak) id<MessageOrderTypeCellDelegate> delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model;

@end


@protocol MessageOrderTypeCellDelegate <NSObject>

@optional
- (void)presentMessageDetailForOrder:(NSString *)orderId;

@end
