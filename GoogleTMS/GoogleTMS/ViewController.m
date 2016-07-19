//
//  ViewController.m
//  GoogleTMS
//
//  Created by aa on 16/7/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "ViewController.h"
#import "MapBaseView.h"
#import "MapTileConvert.h"
#import "UIMacro.h"

@interface ViewController ()

@property (nonatomic,strong) MapBaseView        *baseView;
@property (nonatomic,assign) double              longitudeD;
@property (nonatomic,assign) double              latitudeD;
@property (nonatomic,assign) int                 zoomLevel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.zoomLevel = 16;
    self.zoom.value = self.zoomLevel;
    self.longitudeD = 113.7314513950;
    self.latitudeD = 34.7760401166;
//    NSInteger xIndex = long2tilex(113.7314513950, zoomLevel);
//    NSInteger yIndex = lat2tiley(34.7760401166, zoomLevel);
    self.baseView = [[MapBaseView alloc] initWithFrame:self.view.bounds];
    [self.baseView setCenterLongitude:self.longitudeD andLatitude:self.latitudeD andZoomLevel:self.zoomLevel];
    [self.view addSubview:self.baseView];
//    [(MapBaseView *)self.view setCenterLongitude:longitude andLatitude:latitude andZoomLevel:zoomLevel];
    
    [self.view addSubview:self.TopVIew];
    [self.view addSubview:self.zoom];
    UIImageView
}

- (IBAction)locate:(id)sender
{
    self.longitudeD = [self.longitude.text doubleValue];
    self.latitudeD = [self.latitude.text doubleValue];
    [self.baseView setCenterLongitude:self.longitudeD andLatitude:self.latitudeD andZoomLevel:self.zoomLevel];
    [self.longitude resignFirstResponder];
    [self.latitude resignFirstResponder];
}

- (IBAction)zoom:(id)sender
{
    UIStepper *steper = (UIStepper *)sender;
    self.zoomLevel = (int)steper.value;
    [self.baseView setCenterLongitude:self.longitudeD andLatitude:self.latitudeD andZoomLevel:self.zoomLevel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
