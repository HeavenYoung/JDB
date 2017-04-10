//
//  ChangePayPasswordViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "ChangePayPasswordViewController.h"

@interface ChangePayPasswordViewController ()

@property (nonatomic, copy) NSString *titleString;


@end

@implementation ChangePayPasswordViewController

-(instancetype)initWithTitleString:(NSString *)titleString{
    
    self = [super init];
    if (self) {
        self.titleString = titleString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.titleString;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];

}

- (void)setupUI{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
