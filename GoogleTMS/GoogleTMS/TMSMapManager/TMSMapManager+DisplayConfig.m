//
//  TMSMapManager+DisplayConfig.m
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapManager+DisplayConfig.h"

static CGFloat kMapTileWidth = 128;
static CGFloat kMapTileHeight = 128;

@implementation TMSMapManager (DisplayConfig)

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

@end
