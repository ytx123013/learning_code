//
//  TMSMapManager.h
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

@interface TMSMapManager : NSObject

@property (nonatomic,assign) int                     zoomLevel;
@property (nonatomic,assign) int                     maxZoomLevel;
@property (nonatomic,assign) CGSize                  mapTileSize;

@property (nonatomic,strong) NSMutableArray         *mapTilesArray;

+ (instancetype)sharedManager;

@end
