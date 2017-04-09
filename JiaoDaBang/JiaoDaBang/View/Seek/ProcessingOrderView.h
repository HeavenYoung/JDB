//
//  ProcessingOrderView.h
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProcessingOrderViewDelegate <NSObject>

- (void)jumptoDetailWithOrderData:(OrderData *)order;

@end

@interface ProcessingOrderView : UIView

@property (nonatomic, weak) id <ProcessingOrderViewDelegate> delegate;

@end
