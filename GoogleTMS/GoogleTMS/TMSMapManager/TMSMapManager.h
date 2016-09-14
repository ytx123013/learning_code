//
//  TMSMapManager.h
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import "TMSMapScrollView.h"

@interface TMSMapManager : NSObject

@property (nonatomic,assign) int                     zoomLevel;
@property (nonatomic,assign) int                     minZoomLevel;
@property (nonatomic,assign) int                     maxZoomLevel;
@property (nonatomic,assign) CGSize                  mapTileSize;
@property (nonatomic,assign) float                   mapTileImageScale;


@property (nonatomic,strong) NSMutableArray         *mapTilesArray;
@property (nonatomic,strong) NSArray                *mapTileImageViewsArray;

@property (nonatomic,strong) TMSMapScrollView       *mapScrollView;

+ (instancetype)sharedManager;
- (void)initData;
- (void)resetBaseMapViewWithFrame:(CGRect)frame;

@end
