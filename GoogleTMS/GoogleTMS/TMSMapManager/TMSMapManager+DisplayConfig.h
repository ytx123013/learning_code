//
//  TMSMapManager+DisplayConfig.h
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapManager.h"
#import <CoreGraphics/CGGeometry.h>

@interface TMSMapManager (DisplayConfig)

//- (void)setMaxZoomLevel:(int)maxZoomLevel;
//- (int)getMaxZoomLevel;
//
//
//- (void)setMapZoomLevel:(int)zoomLevel;
//- (int)getMapZoomLevel;
//
//- (void)setMapTileSize:(CGSize)mapTileSize;
//- (CGSize)getMapTileSize;
//
//- (int)getXCountWithZoomLevel:(int)zoomLevel;
//- (int)getYCountWithZoomLevel:(int)zoomLevel;
//
//- (CGSize)getBGViewSizeWithMapZoomLevel:(int)zoomLevel;


- (void)setTMSMapTileImageScale:(float)scale;

- (int)getDefaultMinZoomLevel;
- (int)getDefaultMaxZoomLevel;
- (CGSize)getScaledMapTileSize;
- (CGSize)getDefaultMapTileSize;

- (void)initalMapDefaultConfig;

@end
