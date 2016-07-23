//
//  MapTileInfoModel.m
//  GoogleTMS
//
//  Created by aa on 16/7/23.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "MapTileInfoModel.h"
#import "NetMacro.h"

@implementation MapTileInfoModel

- (void)resetMapTileImageURLString
{
    self.mapTileURLString = MapTileUrl(self.xIndex, self.yIndex, self.zoomLevel);
}

@end
