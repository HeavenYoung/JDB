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
#import "CustomMAPointAnnotation.h"
#import "CustomMAAnnotationView.h"

@interface HelpViewController () <MAMapViewDelegate>

@property (nonatomic , weak) MAMapView *mapView;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [AMapServices sharedServices].enableHTTPS = YES;
    
    [self initMap];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [self getPosNumList];
}

- (void)initMap{
    
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49)];
    
    [mapView setZoomLevel:17.5 animated:YES];
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.952272, 116.342779) animated:YES];
    mapView.delegate = self;
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView = mapView;
    [self.view addSubview:mapView];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.backgroundColor = [UIColor redColor];
    [submitBtn addTarget:self action:@selector(location)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-69);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
}

- (void)location{
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
}

- (void)getPosNumList{
    PosNumRequest *posNumRequest = [[PosNumRequest alloc] init];
    [posNumRequest setSuccessBlock:^(id object, id responseObject) {
        DLog("---地图点成功---");
        
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        
        PosNumListData *listData = (PosNumListData *)object;
        for (PosNumData *posData in listData.posNumDataArray) {
            
            CustomMAPointAnnotation *pointAnnotation = [[CustomMAPointAnnotation alloc] init];
            pointAnnotation.coordinate = CLLocationCoordinate2DMake(posData.lat.floatValue, posData.lng.floatValue);
            pointAnnotation.title = posData.count;
            pointAnnotation.posData = posData;
            [mArray addObject:pointAnnotation];
        }
        
        [self.mapView addAnnotations:mArray];
        
    }];
    [posNumRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        DLog("---地图点失败---");
    }];
    [posNumRequest sendRequest];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {

    CustomMAPointAnnotation *pointAnnotation = (CustomMAPointAnnotation *)annotation;
    
    if ([annotation isKindOfClass:[CustomMAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        CustomMAAnnotationView *annotationView = (CustomMAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[CustomMAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:reuseIndetifier];
        }
        annotationView.centerOffset = CGPointMake(-6, -18);
        annotationView.count = pointAnnotation.posData.count;
        return annotationView;
    }
    return nil;
}

- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {

    DLog(@"-------------");
    
    CustomMAAnnotationView *customView = (CustomMAAnnotationView *)view;
    
    CustomMAPointAnnotation *pointAnnotation = (CustomMAPointAnnotation *)customView.annotation;
    
    DLog(@"--- title ---%@", pointAnnotation.title);
    DLog(@"--- srcID ---%@", pointAnnotation.posData.srcId);

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
