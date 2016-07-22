//
//  MapBaseView.m
//  GoogleTMS
//
//  Created by aa on 16/7/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "MapBaseView.h"
#import "UIMacro.h"
#import "MapTileConvert.h"
#import "NetMacro.h"
#import <UIImageView+WebCache.h>
#import "TMSMapManager+DisplayConfig.h"

@implementation MapBaseView

- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        CGSize mapTileSize = [[TMSMapManager sharedManager] getDefaultMapTileSize];
        self.countOfMapTiles = kCountOfHorizontalMapTile * kCountOfVerticalMapTile;
        self.mapTiles = [[NSMutableArray alloc] init];
        for (int i = 0; i < self.countOfMapTiles; i++) {
            NSInteger imageHIndex = i % kCountOfHorizontalMapTile;
            NSInteger imageVindex = i / kCountOfVerticalMapTile;
            UIImageView *mapImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageHIndex*kMapTileWidth, imageVindex*kMapTileHeight, kMapTileWidth, kMapTileHeight)];
//            mapImageView.image = [UIImage imageNamed:@"1.png"];
            mapImageView.layer.borderWidth = 1;
            mapImageView.layer.borderColor = [[UIColor redColor] CGColor];
            [self addSubview:mapImageView];
            
            [self.mapTiles addObject:mapImageView];
        }
    }
    return self;
}

- (void)setCenterLongitude:(double)longitude andLatitude:(double)latitude andZoomLevel:(int)level
{
    int xIndex = long2tilex(longitude, level);
    int yIndex = lat2tiley(latitude, level);
    NSMutableArray *xIndexArray = [[NSMutableArray alloc] init];
    NSMutableArray *yIndexArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < kCountOfVerticalMapTile; i++) {
        for (int j = 0 ; j < kCountOfVerticalMapTile; j++) {
            [xIndexArray addObject:[NSNumber numberWithInt:(xIndex + j)]];
            [yIndexArray addObject:[NSNumber numberWithInt:(yIndex - 1 + i)]];
        }
    }
    for (int z = 0; z < self.mapTiles.count; z++) {
        UIImageView *imageView = [self.mapTiles objectAtIndex:z];
        int xIndex = [[xIndexArray objectAtIndex:z] intValue];
        int yIndex = [[yIndexArray objectAtIndex:z] intValue];
        NSURL *imageURL = [NSURL URLWithString:MapTileUrl(xIndex, yIndex, level)];
        [imageView sd_setImageWithURL:imageURL];
    }
}

@end
