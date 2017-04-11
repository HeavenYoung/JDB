//
//  HelpViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "HelpViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface HelpViewController ()

@property (nonatomic , weak) MAMapView *mapView;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [AMapServices sharedServices].enableHTTPS = YES;
    
    [self initMap];
    [self getPosNumList];
}

- (void)initMap{
    
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49)];
    
    [mapView setZoomLevel:17.5 animated:YES];
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.952272, 116.342779) animated:YES];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView = mapView;
    [self.view addSubview:mapView];
}

- (void)getPosNumList{
    PosNumRequest *posNumRequest = [[PosNumRequest alloc] init];
    [posNumRequest setSuccessBlock:^(id object, id responseObject) {
        DLog("---地图点成功---");
    }];
    [posNumRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        DLog("---地图点失败---");
    }];
    [posNumRequest sendRequest];
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
