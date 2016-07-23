//
//  MapTileUtil.h
//  GoogleTMS
//
//  Created by aa on 16/7/23.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapTileInfoModel.h"

@interface MapTileUtil : NSObject

+ (int)getXMaxIndexAtZoomLevel:(int)zoomLevel;
+ (int)getYMaxIndexAtZoomLevel:(int)zoomLevel;

+ (NSArray *)getXIndexesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel;
+ (NSArray *)getYIndexesInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel;
+ (CGPoint)getMapTileOriginAtXIndex:(int)xIndex andYIndex:(int)yIndex;

+ (NSArray *)getLoadMapTilesInfoInRect:(CGRect)displayRect atZoomLevel:(int)zoomLevel;
+ (CGSize)getBaseMapViewSizeWithZoomLevel:(int)zoomLevel;

@end
