//
//  InfoInputView.h
//  MiTang_Client
//
//  Created by Heaven on 16/5/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol InputViewDelegate;

@interface InfoInputView : UIView

@property (nonatomic, copy, readonly) NSString *contentString;

// 文本输入框
@property (nonatomic, weak) UITextField *textField;

@property (nonatomic, weak) id<InputViewDelegate> delegate;

/**
 *  textField封装
 *
 *  @param frame        frame
 *  @param titleString  placeHolder
 *  @param secureType   密码类型 1 为加密型
 *  @param keyboardType 键盘类型 
 *
 *  @return textField
 */
- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder secureType:(NSInteger)secureType keyboardType:(UIKeyboardType)keyboardType;

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder secureType:(NSInteger)secureType keyboardType:(UIKeyboardType)keyboardType shouldInput:(BOOL)shouldInput;

@end


@protocol InputViewDelegate <NSObject>

@optional
- (void)callBackOnDidBeginEdite:(NSInteger)tag;

- (void)callBackOnDidEndEdite:(NSInteger)tag;


@end
