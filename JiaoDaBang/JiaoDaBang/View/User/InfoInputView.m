//
//  InfoInputView.m
//  MiTang_Client
//
//  Created by Heaven on 16/5/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "InfoInputView.h"

@interface InfoInputView () <UITextFieldDelegate>

@property (nonatomic, copy) NSString *placeHolder;

@property (nonatomic, assign) BOOL shouldInput;

@end

@implementation InfoInputView

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder secureType:(NSInteger)secureType keyboardType:(UIKeyboardType)keyboardType{

    return [self initWithFrame:frame placeHolder:placeHolder secureType:secureType keyboardType:keyboardType shouldInput:YES];
}

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder secureType:(NSInteger)secureType keyboardType:(UIKeyboardType)keyboardType shouldInput:(BOOL)shouldInput {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.placeHolder = placeHolder;
        self.shouldInput = shouldInput;
        [self placeSubviewsWithType:secureType keyboardType:keyboardType];
    }
    return self;
}

- (void)placeSubviewsWithType:(NSInteger)type keyboardType:(UIKeyboardType)keyboardType {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.secureTextEntry = (type == 1)? YES : NO;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = UIReturnKeyDone;
    textField.enablesReturnKeyAutomatically = YES;
//    textField.placeholder = self.placeHolder;
    textField.textColor = [UIColor whiteColor];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeHolder attributes:@{NSForegroundColorAttributeName:PlaceTextColor ,NSFontAttributeName:PlaceTextFont}];

    textField.delegate = self;
    self.textField = textField;
    [self addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH-10));
        make.height.equalTo(@0.5);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).offset(5);
    }];
}

- (NSString *)contentString {
    return self.textField.text;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return self.shouldInput;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (_delegate && [_delegate respondsToSelector:@selector(callBackOnDidBeginEdite:)]) {
        [_delegate callBackOnDidBeginEdite:self.tag];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (_delegate && [_delegate respondsToSelector:@selector(callBackOnDidEndEdite:)]) {
        [_delegate callBackOnDidEndEdite:self.tag];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_delegate && [_delegate respondsToSelector:@selector(callBackOnDidEndEdite:)]) {
        [_delegate callBackOnDidEndEdite:self.tag];
    }
    return YES;
}

@end
