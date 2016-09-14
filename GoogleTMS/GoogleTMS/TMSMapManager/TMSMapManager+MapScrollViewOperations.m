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
/*    NSArray *mapTileInfos = [MapTileUtil getLoadMapTilesInfoInRect:displayRect atZoomLevel:zoomLevel];
    NSMutableArray *mapTileImageViewsArray = [[NSMutableArray alloc] initWithCapacity:mapTileInfos.count];
    for (MapTileInfoModel *model in mapTileInfos) {
        TMSMapTileImageView *imageView = [[TMSMapTileImageView alloc] initWithInfoModel:model];
        [mapTileImageViewsArray addObject:imageView];
    }
    return mapTileImageViewsArray;*/
    return [self getTMSMapTileImageViewsAtRect:displayRect atZoomLevel:zoomLevel andScrollViewBoundsOrigin:CGPointMake(0, 0)];
}

- (NSArray *)getTMSMapTileImageViewsAtRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel andScrollViewBoundsOrigin:(CGPoint)origin
{
    NSArray *mapTileInfos = [MapTileUtil getLoadMapTilesInfoInRect:displayRect atZoomLevel:zoomLevel andOffset:origin];
    NSMutableArray *mapTileImageViewsArray = [[NSMutableArray alloc] initWithCapacity:mapTileInfos.count];
    for (MapTileInfoModel *model in mapTileInfos) {
        TMSMapTileImageView *imageView = [[TMSMapTileImageView alloc] initWithInfoModel:model];
        [mapTileImageViewsArray addObject:imageView];
    }
    return mapTileImageViewsArray;
}

- (NSArray *)getFocusTMSMapTileImageViewsAtRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel andScrollViewBoundsOrigin:(CGPoint)origin
{
    NSArray *mapTileInfos = [MapTileUtil getFocusLoadMapTilesInfoInRect:displayRect atZoomLevel:zoomLevel andOffset:origin];
    NSMutableArray *mapTileImageViewsArray = [[NSMutableArray alloc] initWithCapacity:mapTileInfos.count];
    for (MapTileInfoModel *model in mapTileInfos) {
        TMSMapTileImageView *imageView = [[TMSMapTileImageView alloc] initWithInfoModel:model];
        [mapTileImageViewsArray addObject:imageView];
    }
    return mapTileImageViewsArray;
}

- (void)loadMapTilesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel
{
/*    [self removeMapTileImageViews:self.mapTileImageViewsArray];
    self.mapTileImageViewsArray = [self getTMSMapTileImageViewsAtRect:displayRect atZoomLevel:zoomLevel];
    NSLog(@"count :%lu",(unsigned long)self.mapTileImageViewsArray.count);
    for (TMSMapTileImageView *imageView in self.mapTileImageViewsArray) {
//        NSLog(@"%@",imageView.infoModel.mapTileURLString);
        NSLog(@"index:%d %d %f %f",imageView.infoModel.xIndex,imageView.infoModel.yIndex,imageView.infoModel.mapTileOrigin.x,imageView.infoModel.mapTileOrigin.y);
    }
    [self addMapTiles:self.mapTileImageViewsArray];*/
    [self loadMapTilesInRect:displayRect atZoomLevel:zoomLevel andScrollViewBoundsOrigin:CGPointMake(0, 0)];
}

- (void)loadMapTilesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel andScrollViewBoundsOrigin:(CGPoint)origin
{
    [self removeMapTileImageViews:self.mapTileImageViewsArray];
    self.mapTileImageViewsArray = [self getTMSMapTileImageViewsAtRect:displayRect atZoomLevel:zoomLevel andScrollViewBoundsOrigin:origin];
    [self addMapTiles:self.mapTileImageViewsArray];
}

- (void)focusLoadMapTilesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel andScrollViewBoundsOrigin:(CGPoint)origin
{
    [self removeMapTileImageViews:self.mapTileImageViewsArray];
    self.mapTileImageViewsArray = [self getFocusTMSMapTileImageViewsAtRect:displayRect atZoomLevel:zoomLevel andScrollViewBoundsOrigin:origin];
    [self addMapTiles:self.mapTileImageViewsArray];

}

@end
