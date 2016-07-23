//
//  MapTileInfoModel.h
//  GoogleTMS
//
//  Created by aa on 16/7/23.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

@interface MapTileInfoModel : NSObject

@property (nonatomic,assign) int         xIndex;
@property (nonatomic,assign) int         yIndex;
@property (nonatomic,assign) int         zoomLevel;
@property (nonatomic,assign) CGPoint     mapTileOrigin;
@property (nonatomic,assign) CGSize      mapTileSize;

@property (nonatomic,strong) NSString   *mapTileURLString;

- (void)resetMapTileImageURLString;

@end
