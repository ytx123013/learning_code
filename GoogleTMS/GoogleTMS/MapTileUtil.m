//
//  MapTileUtil.m
//  GoogleTMS
//
//  Created by aa on 16/7/23.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "MapTileUtil.h"
#import "TMSMapManager+DisplayConfig.h"
#import "MapTileInfoModel.h"
#include <math.h>

@implementation MapTileUtil

+ (int)getXMaxIndexAtZoomLevel:(int)zoomLevel
{
    return pow(2, zoomLevel);
}

+ (int)getYMaxIndexAtZoomLevel:(int)zoomLevel
{
    return pow(2, zoomLevel);
}

+ (NSArray *)getXIndexesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    CGFloat mapTileWidth = [[TMSMapManager sharedManager] getDefaultMapTileSize].width;
    NSMutableArray *xIndexes = [[NSMutableArray alloc] init];
    //考虑到并非所有maptile显示全 所以＋2
    int xDisplayMapTileCount = displayRect.size.width/mapTileWidth + 2;
    int startXIndex = displayRect.origin.x/mapTileWidth - 1;
    for (int i = startXIndex; i <= startXIndex+xDisplayMapTileCount; i++) {
        if (i < 0 || i >= [self getXMaxIndexAtZoomLevel:zoomLevel]) {
            continue;
        }
        NSNumber *xIndexNumber = [NSNumber numberWithInt:i];
        [xIndexes addObject:xIndexNumber];
    }
    return xIndexes;
}

+ (NSArray *)getYIndexesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    CGFloat mapTileHeight = [[TMSMapManager sharedManager] getDefaultMapTileSize].height;
    NSMutableArray *yIndexes = [[NSMutableArray alloc] init];
    //考虑到并非所有maptile显示全 所以＋2
    int yDisplayMapTileCount = displayRect.size.width/mapTileHeight + 2;
    int startYIndex = displayRect.origin.y/mapTileHeight - 1;
    for (int i = startYIndex; i <= startYIndex+yDisplayMapTileCount; i++) {
        if (i < 0 || i >= [self getYMaxIndexAtZoomLevel:zoomLevel]) {
            continue;
        }
        NSNumber *xIndexNumber = [NSNumber numberWithInt:i];
        [yIndexes addObject:xIndexNumber];
    }
    return yIndexes;
}

+ (CGPoint)getMapTileOriginAtXIndex:(int)xIndex andYIndex:(int)yIndex
{
    CGSize mapTileSize = [[TMSMapManager sharedManager] getDefaultMapTileSize];
    CGPoint origin = CGPointMake(xIndex*mapTileSize.width, yIndex*mapTileSize.height);
    return origin;
}

+ (NSArray *)getLoadMapTilesInfoInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    NSArray *xIndexes = [self getXIndexesInRect:displayRect atZoomLevel:zoomLevel];
    NSArray *yIndexes = [self getYIndexesInRect:displayRect atZoomLevel:zoomLevel];
    NSUInteger loadMapTileTotalCount = xIndexes.count*yIndexes.count;
    NSMutableArray *loadMapTilesInfos = [[NSMutableArray alloc] initWithCapacity:loadMapTileTotalCount];
    CGSize mapTileSize = [[TMSMapManager sharedManager] getDefaultMapTileSize];
    for (int i = 0; i < yIndexes.count; i++) {
        for (int j = 0; j < xIndexes.count; j++) {
            MapTileInfoModel *model = [[MapTileInfoModel alloc] init];
            model.xIndex = [[xIndexes objectAtIndex:j] intValue];
            model.yIndex = [[yIndexes objectAtIndex:i] intValue];
            model.zoomLevel = zoomLevel;
            model.mapTileOrigin = [self getMapTileOriginAtXIndex:model.xIndex andYIndex:model.yIndex];
            model.mapTileSize = mapTileSize;
            [model resetMapTileImageURLString];
            [loadMapTilesInfos addObject:model];
        }
    }
    return loadMapTilesInfos;
}

+ (CGSize)getBaseMapViewSizeWithZoomLevel:(int)zoomLevel
{
    CGSize mapTileSize = [[TMSMapManager sharedManager] getDefaultMapTileSize];
    return CGSizeMake(mapTileSize.width*[self getXMaxIndexAtZoomLevel:zoomLevel], mapTileSize.height*[self getYMaxIndexAtZoomLevel:zoomLevel]);
}

@end
