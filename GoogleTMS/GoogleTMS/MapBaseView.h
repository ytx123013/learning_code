//
//  MapBaseView.h
//  GoogleTMS
//
//  Created by aa on 16/7/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapBaseView : UIView

@property (nonatomic,strong) NSMutableArray     *mapTiles;
@property (nonatomic,assign) NSInteger           countOfMapTiles;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setCenterLongitude:(double)longitude andLatitude:(double)latitude andZoomLevel:(int)level;

@end
