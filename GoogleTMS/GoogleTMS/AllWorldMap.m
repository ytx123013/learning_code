//
//  AllWorldMap.m
//  GoogleTMS
//
//  Created by aa on 16/7/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "AllWorldMap.h"
#import "UIMacro.h"
#include <math.h>
#import "TMSMapManager+DisplayConfig.h"
#import "MapTileImageView.h"
#import "NetMacro.h"
#import <UIImageView+WebCache.h>

static int kZoomLevel = 2;
static int MapTileWidth = 256;
static int MapTileHeight = 256;

@implementation AllWorldMap

- (int)getMapTileCount
{
    int zoom = [[TMSMapManager sharedManager] getDefaultMinZoomLevel];
    return pow(4, zoom);
}

- (int)getXCount
{
    int zoom = [[TMSMapManager sharedManager] getDefaultMinZoomLevel];
    return pow(2, zoom);
}

- (int)getYCount
{
    int zoom = [[TMSMapManager sharedManager] getDefaultMinZoomLevel];
    return pow(2, zoom);
}


- (void)resetViewFrame
{
    self.bounces = NO;
//    CGSize bgSize = [[TMSMapManager sharedManager] getBGViewSizeWithMapZoomLevel:kZoomLevel];
    CGSize bgSize = CGSizeZero;
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MapTileWidth*[self getXCount], MapTileHeight*[self getYCount])];
    CGSize mapTileSize = [[TMSMapManager sharedManager] getDefaultMapTileSize];
    self.frame = CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    self.contentSize = CGSizeMake(mapTileSize.width*[self getXCount], mapTileSize.height*[self getYCount]);
    self.mapTilesArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self getXCount]; i++) {
        for (int j = 0; j < [self getYCount]; j++) {
            MapTileImageView *imageView = [[MapTileImageView alloc] init];
            imageView.frame = CGRectMake(i*mapTileSize.width, j*mapTileSize.height, mapTileSize.width, mapTileSize.height);
            imageView.mapTileImageUrlString = MapTileUrl(i, j, [[TMSMapManager sharedManager] getDefaultMinZoomLevel]);
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageView.mapTileImageUrlString]];
            [self.mapTilesArray addObject:imageView];
            [self.bgImageView addSubview:imageView];
        }
    }
    [self addSubview:self.bgImageView];
}



@end
