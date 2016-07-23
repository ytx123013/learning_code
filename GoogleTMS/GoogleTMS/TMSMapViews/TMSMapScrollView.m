//
//  TMSMapScrollView.m
//  GoogleTMS
//
//  Created by aa on 16/7/22.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapScrollView.h"
#import "MapTileUtil.h"
#import "TMSMapManager+DisplayConfig.h"
#import "UIMacro.h"

@implementation TMSMapScrollView

- (void)initalMapView
{
    self.minimumZoomScale = 1;
    self.maximumZoomScale = [[TMSMapManager sharedManager] getDefaultMaxZoomLevel];
    self.bouncesZoom = NO;
    self.bounces = NO;
    
    int zoomLevel = [[TMSMapManager sharedManager] getDefaultMinZoomLevel];
    CGSize mapSize = [MapTileUtil getBaseMapViewSizeWithZoomLevel:zoomLevel];
    self.frame = CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    self.contentSize = CGSizeMake(mapSize.width, mapSize.height);
    self.baseMapView = [[TMSBaseMapView alloc] initWithFrame:CGRectMake(0, 0, mapSize.width, mapSize.height)];
    [self addSubview:self.baseMapView];
}

- (void)addMapTileImageView:(TMSMapTileImageView *)mapTile
{
    [self.baseMapView addSubview:mapTile];
}

@end
