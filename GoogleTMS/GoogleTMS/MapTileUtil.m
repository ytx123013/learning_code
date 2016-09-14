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

+ (CGRect)convertRect:(CGRect)displayRect toRectAtZoomLevel:(int)zoomLevel
{
    double xPer = displayRect.origin.x/displayRect.size.width;
    double yPer = displayRect.origin.y/displayRect.size.height;
    CGSize mapSize = [self getBaseMapViewSizeWithZoomLevel:zoomLevel];
    return CGRectMake(mapSize.width*xPer, mapSize.height*yPer, mapSize.width, mapSize.height);
}

+ (NSArray *)getXIndexesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    CGFloat mapTileWidth = [[TMSMapManager sharedManager] getScaledMapTileSize].width;
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
    CGFloat mapTileHeight = [[TMSMapManager sharedManager] getScaledMapTileSize].height;
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
/*    CGSize mapTileSize = [[TMSMapManager sharedManager] getScaledMapTileSize];
    CGPoint origin = CGPointMake(xIndex*mapTileSize.width, yIndex*mapTileSize.height);
    return origin;*/
    return [self getMapTileOriginAtXIndex:xIndex andYIndex:yIndex andOffset:CGPointMake(0, 0)];
}

+ (CGPoint)getMapTileOriginAtXIndex:(int)xIndex andYIndex:(int)yIndex andOffset:(CGPoint)offset
{
    CGSize mapTileSize = [[TMSMapManager sharedManager] getScaledMapTileSize];
    CGPoint origin = CGPointMake(xIndex*mapTileSize.width - offset.x, yIndex*mapTileSize.height - offset.y);
    return origin;
}

+ (NSArray *)getLoadMapTilesInfoInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    /*NSArray *xIndexes = [self getXIndexesInRect:displayRect atZoomLevel:zoomLevel];
    NSArray *yIndexes = [self getYIndexesInRect:displayRect atZoomLevel:zoomLevel];
//    NSLog(@"%@ %@",xIndexes,yIndexes);
    NSUInteger loadMapTileTotalCount = xIndexes.count*yIndexes.count;
    NSMutableArray *loadMapTilesInfos = [[NSMutableArray alloc] initWithCapacity:loadMapTileTotalCount];
    CGSize mapTileSize = [[TMSMapManager sharedManager] getScaledMapTileSize];
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
    return loadMapTilesInfos;*/
    return [self getLoadMapTilesInfoInRect:displayRect atZoomLevel:zoomLevel andOffset:CGPointMake(0, 0)];
}

+ (NSArray *)getLoadMapTilesInfoInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel andOffset:(CGPoint)offset
{
    NSArray *xIndexes = [self getXIndexesInRect:displayRect atZoomLevel:zoomLevel];
    NSArray *yIndexes = [self getYIndexesInRect:displayRect atZoomLevel:zoomLevel];
    //    NSLog(@"%@ %@",xIndexes,yIndexes);
    NSUInteger loadMapTileTotalCount = xIndexes.count*yIndexes.count;
    NSMutableArray *loadMapTilesInfos = [[NSMutableArray alloc] initWithCapacity:loadMapTileTotalCount];
    CGSize mapTileSize = [[TMSMapManager sharedManager] getScaledMapTileSize];
    for (int i = 0; i < yIndexes.count; i++) {
        for (int j = 0; j < xIndexes.count; j++) {
            MapTileInfoModel *model = [[MapTileInfoModel alloc] init];
            model.xIndex = [[xIndexes objectAtIndex:j] intValue];
            model.yIndex = [[yIndexes objectAtIndex:i] intValue];
            model.zoomLevel = zoomLevel;
            model.mapTileOrigin = [self getMapTileOriginAtXIndex:model.xIndex andYIndex:model.yIndex andOffset:offset];
            model.mapTileSize = mapTileSize;
            [model resetMapTileImageURLString];
            [loadMapTilesInfos addObject:model];
        }
    }
    return loadMapTilesInfos;
}

+ (NSArray *)getFocusLoadMapTilesInfoInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel andOffset:(CGPoint)offset
{
    NSMutableArray *xIndexes = [[NSMutableArray alloc] init];
    NSMutableArray *yIndexes = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self getXMaxIndexAtZoomLevel:zoomLevel]; i++) {
        [xIndexes addObject:[NSNumber numberWithInt:i]];
        [yIndexes addObject:[NSNumber numberWithInt:i]];
    }
    //    NSLog(@"%@ %@",xIndexes,yIndexes);
    NSUInteger loadMapTileTotalCount = xIndexes.count*yIndexes.count;
    NSMutableArray *loadMapTilesInfos = [[NSMutableArray alloc] initWithCapacity:loadMapTileTotalCount];
    CGSize mapTileSize = [[TMSMapManager sharedManager] getScaledMapTileSize];
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
    CGSize mapTileSize = [[TMSMapManager sharedManager] getScaledMapTileSize];
    return CGSizeMake(mapTileSize.width*[self getXMaxIndexAtZoomLevel:zoomLevel], mapTileSize.height*[self getYMaxIndexAtZoomLevel:zoomLevel]);
}

+ (int)getZoomLevelWithSize:(CGSize)mapSize
{
    int count = (int)mapSize.width/[[TMSMapManager sharedManager] getDefaultMapTileSize].width;
    double zoom = log2((double)count);
    return (int)zoom;
}

@end
