//
//  TMSMapManager+DisplayConfig.m
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapManager+DisplayConfig.h"

static CGFloat       kMapTileWidth = 128;
static CGFloat       kMapTileHeight = 128;

static int           kMapMaxZoomLevel = 22;
static int           kMapMinZoomLevel = 2;

@implementation TMSMapManager (DisplayConfig)

- (void)setMaxZoomLevel:(int)maxZoomLevel
{
    self.maxZoomLevel = maxZoomLevel;
}

- (int)getMaxZoomLevel
{
    return self.maxZoomLevel;
}

- (void)setMapZoomLevel:(int)zoomLevel
{
    self.zoomLevel = zoomLevel;
}

- (int)getMapZoomLevel
{
    return self.zoomLevel;
}

- (CGSize)getMapTileSize
{
    return CGSizeMake(kMapTileWidth, kMapTileHeight);
}

- (int)getXCountWithZoomLevel:(int)zoomLevel
{
    return pow(2, zoomLevel);
}

- (int)getYCountWithZoomLevel:(int)zoomLevel
{
    return pow(2, zoomLevel);
}

- (CGSize)getBGViewSizeWithMapZoomLevel:(int)zoomLevel
{
    CGSize bgSize = CGSizeMake(kMapTileWidth*[self getXCountWithZoomLevel:zoomLevel], kMapTileHeight*[self getYCountWithZoomLevel:zoomLevel]);
    return bgSize;
}

#pragma mark - default value
- (void)setTMSMapTileImageScale:(float)scale
{
    self.mapTileImageScale = scale;
}
- (int)getDefaultMinZoomLevel
{
    return kMapMinZoomLevel;
}

- (int)getDefaultMaxZoomLevel
{
    return kMapMaxZoomLevel;
}

- (CGSize)getScaledMapTileSize
{
    return CGSizeMake(kMapTileWidth*self.mapTileImageScale, kMapTileHeight*self.mapTileImageScale);
//    return CGSizeMake(kMapTileWidth, kMapTileHeight);
}

- (CGSize)getDefaultMapTileSize
{
    return CGSizeMake(kMapTileWidth, kMapTileHeight);
}

- (void)initalMapDefaultConfig
{
    self.minZoomLevel = kMapMinZoomLevel;
    self.maxZoomLevel = kMapMaxZoomLevel;
    self.zoomLevel = 2;
    self.mapTileSize = CGSizeMake(kMapTileWidth, kMapTileHeight);
    self.mapTileImageScale = 1.0;
}

@end
