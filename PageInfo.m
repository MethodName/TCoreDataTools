//
//  HSDPageInfo.m
//  HaoShiDai
//
//  Created by 沈佳 on 14/12/22.
//  Copyright (c) 2014年 360haoshidai. All rights reserved.
//

#import "HSDPageInfo.h"

@implementation HSDPageInfo

-(instancetype)init{
    self = [super init];
    if (self) {
        self.pageSzie = 10;
        self.pageIndex = 0;
    }
    return self;
}

@end
