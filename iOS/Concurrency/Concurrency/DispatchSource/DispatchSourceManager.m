//
//  DispatchSourceManager.m
//  Concurrency
//
//  Created by aa on 16/11/30.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "DispatchSourceManager.h"

@interface DispatchSourceManager ()



@end

@implementation DispatchSourceManager

+ (instancetype)sharedManager
{
    static DispatchSourceManager *__defaultManager__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __defaultManager__ = [[DispatchSourceManager alloc] init];
    });
    return __defaultManager__;
}

- (instancetype)init
{
    if (self = [super init]) {
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, <#dispatchQueue#>);
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, <#intervalInSeconds#> * NSEC_PER_SEC, <#leewayInSeconds#> * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            <#code to be executed when timer fires#>
        });
        dispatch_resume(timer);
    }
    return self;
}


@end
