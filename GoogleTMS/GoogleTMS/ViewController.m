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
#import "AllWorldMap.h"
#import "TMSMapManager.h"
#import "TMSMapManager+MapScrollViewOperations.h"
#import "TMSMapManager+DisplayConfig.h"
#import "MapTileUtil.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) MapBaseView        *baseView;
@property (nonatomic,assign) double              longitudeD;
@property (nonatomic,assign) double              latitudeD;
@property (nonatomic,assign) int                 zoomLevel;

@property (nonatomic,strong) AllWorldMap        *allWorldMap;
@property (nonatomic,assign) float               lastScale;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
/*    self.zoomLevel = 16;
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
    [self.view addSubview:self.zoom];*/
/*    AllWorldMap *map = [[AllWorldMap alloc] init];
    self.allWorldMap = map;
//    UIPinchGestureRecognizer *ges = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [map resetViewFrame];
//    [map addGestureRecognizer:ges];
    map.minimumZoomScale = 1.0;
    map.maximumZoomScale = 20.0;
    map.bouncesZoom = NO;
    map.delegate = self;
    
    [self.view addSubview:map];*/
//    map.canCancelContentTouches=NO;
//    map.showsHorizontalScrollIndicator = NO;
//    map.showsVerticalScrollIndicator = NO;
    
//    map.delaysContentTouches=NO;
    self.zoomLevel = 2;
    [[TMSMapManager sharedManager] initData];
    TMSMapScrollView *scrollView = [[TMSMapManager sharedManager] getMapScrollView];
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    [[TMSMapManager sharedManager] loadMapTilesInRect:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) atZoomLevel:self.zoomLevel];
    
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    CGRect visiableRect = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, kScreenSize.width, kScreenSize.height);
    self.zoomLevel = [MapTileUtil getZoomLevelWithSize:view.frame.size];
    float zoomWidth = 128*pow(2, self.zoomLevel);
    float scaled = view.frame.size.width/zoomWidth;
    [[TMSMapManager sharedManager] setTMSMapTileImageScale:scaled];
    TMSBaseMapView *view1 =  [[TMSMapManager sharedManager] getMapScrollView].baseMapView ;
    [[TMSMapManager sharedManager] resetBaseMapViewWithFrame:view1.frame];
    if (scale == 1.0000) {
//        [[TMSMapManager sharedManager] loadMapTilesInRect:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) atZoomLevel:self.zoomLevel];
    }else{
        [[TMSMapManager sharedManager] loadMapTilesInRect:visiableRect atZoomLevel:self.zoomLevel];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [[TMSMapManager sharedManager] getMapScrollView].baseMapView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"contentoffset %f %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
/*    CGRect visiableRect = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, kScreenSize.width, kScreenSize.height);
    [[TMSMapManager sharedManager] loadMapTilesInRect:visiableRect atZoomLevel:self.zoomLevel];
    NSLog(@"end deceleration");*/
/*    CGRect visiableRect = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, kScreenSize.width, kScreenSize.height);
    [[TMSMapManager sharedManager] loadMapTilesInRect:visiableRect atZoomLevel:self.zoomLevel];*/
}

-(void)pinch:(UIPinchGestureRecognizer *)recognizer{
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"begin");
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"change");
            self.allWorldMap.bgImageView.transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
            CGRect frame = self.allWorldMap.bgImageView.frame;

            NSLog(@"%f %f %f %f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"end");
            NSLog(@"%f",recognizer.scale);
            NSLog(@"%f %f",self.allWorldMap.contentSize.width,self.allWorldMap.contentSize.height);
            CGRect curRect = self.allWorldMap.bgImageView.frame;
            CGPoint curPoint = self.allWorldMap.contentOffset;
            CGSize oriSize = self.allWorldMap.contentSize;
            CGSize newSize = CGSizeMake(oriSize.width*recognizer.scale, oriSize.height*recognizer.scale);

            self.allWorldMap.bgImageView.frame = CGRectMake(0, 0, curRect.size.width, curRect.size.height);
            self.allWorldMap.contentSize = CGSizeMake(curRect.size.width, curRect.size.height);

            self.allWorldMap.contentOffset = CGPointMake(curPoint.x-curRect.origin.x, curPoint.y-curRect.origin.y);
//            CGRect frame = self.allWorldMap.bgImageView.frame;
//            NSLog(@"%f %f %f %f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
            break;
            
        default:
            break;
    }
 /*   if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
        self.allWorldMap.bgImageView.transform = CGAffineTransformScale(self.allWorldMap.bgImageView.transform, recognizer.scale, recognizer.scale);
        recognizer.scale = 1;
    }*/
//    self.lastScale = recognizer.scale;
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
    NSLog(@"%d",self.zoomLevel);
    [self.baseView setCenterLongitude:self.longitudeD andLatitude:self.latitudeD andZoomLevel:self.zoomLevel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
