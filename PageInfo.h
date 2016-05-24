//
//  HSDPageInfo.h
//  HaoShiDai
//
//  Created by 沈佳 on 14/12/22.
//  Copyright (c) 2014年 360haoshidai. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  分页
 */
@interface PageInfo : NSObject

/**
 *  当前也
 */
@property(nonatomic,assign) NSInteger pageIndex;
/**
 *  页大小
 */
@property(nonatomic,assign) NSInteger pageSzie;


@end
