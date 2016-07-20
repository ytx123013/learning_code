//
//  TMSMapManager.h
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSMapManager : NSObject

@property (nonatomic,assign) int             zoomLevel;

+ (instancetype)sharedManager;

@end
