//
//  TMSMapManager+MapScrollViewOperations.m
//  GoogleTMS
//
//  Created by aa on 16/7/23.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapManager+MapScrollViewOperations.h"
#import "MapTileUtil.h"

@implementation TMSMapManager (MapScrollViewOperations)

- (TMSMapScrollView *)getMapScrollView
{
    return self.mapScrollView;
}

- (void)addMapTileImageView:(TMSMapTileImageView *)mapTile
{
    [self.mapScrollView addMapTileImageView:mapTile];
    [mapTile loadMapTileImage];
}

- (void)addMapTiles:(NSArray *)mapTileImageArray
{
    for (TMSMapTileImageView *imageView in mapTileImageArray) {
        [self addMapTileImageView:imageView];
    }
}

- (void)removeMapTileImageViews:(NSArray *)mapTileImageView
{
    for (TMSMapTileImageView *imageView in mapTileImageView) {
        [imageView removeFromSuperview];
    }
}

- (NSArray *)getTMSMapTileImageViewsAtRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    NSArray *mapTileInfos = [MapTileUtil getLoadMapTilesInfoInRect:displayRect atZoomLevel:zoomLevel];
    for (MapTileInfoModel *model in mapTileInfos) {
//        NSLog(@"%@",model.mapTileURLString);
    }
    NSMutableArray *mapTileImageViewsArray = [[NSMutableArray alloc] initWithCapacity:mapTileInfos.count];
    for (MapTileInfoModel *model in mapTileInfos) {
        TMSMapTileImageView *imageView = [[TMSMapTileImageView alloc] initWithInfoModel:model];
        [mapTileImageViewsArray addObject:imageView];
    }
    return mapTileImageViewsArray;
}

- (void)loadMapTilesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
    [self removeMapTileImageViews:self.mapTileImageViewsArray];
    self.mapTileImageViewsArray = [self getTMSMapTileImageViewsAtRect:displayRect atZoomLevel:zoomLevel];
    [self addMapTiles:self.mapTileImageViewsArray];
}

@end
