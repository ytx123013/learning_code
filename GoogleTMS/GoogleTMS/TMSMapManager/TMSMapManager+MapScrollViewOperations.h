//
//  TMSMapManager+MapScrollViewOperations.h
//  GoogleTMS
//
//  Created by aa on 16/7/23.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapManager.h"
#import "TMSMapScrollView.h"
#import "TMSMapTileImageView.h"

@interface TMSMapManager (MapScrollViewOperations)

- (TMSMapScrollView *)getMapScrollView;

- (void)addMapTileImageView:(TMSMapTileImageView *)mapTile;
- (void)addMapTiles:(NSArray *)mapTileImageArray;
- (void)removeMapTileImageViews:(NSArray *)mapTileImageView;

- (NSArray *)getTMSMapTileImageViewsAtRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel;

- (void)loadMapTilesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel;

@end
