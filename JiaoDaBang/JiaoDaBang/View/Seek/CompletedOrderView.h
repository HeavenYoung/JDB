//
//  CompletedOrderView.h
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CompletedOrderViewDelegate <NSObject>

- (void)jumptoDetailWithOrderData:(OrderData *)order;

@end

@interface CompletedOrderView : UIView

@property (nonatomic, weak) id <CompletedOrderViewDelegate> delegate;

@end
