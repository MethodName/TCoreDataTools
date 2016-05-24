//
//  HSDBaseEtt.h
//  HaoShiDai
//
//  Created by 沈佳 on 14-12-15.
//  Copyright (c) 2014年 shenjia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "NSObject+BindProperty.h"
#import "AppDelegate.h"
#import "PageInfo.h"

/**
 *  实体基类
 */
@interface BaseEtt : NSManagedObject



//获取类名
+(NSString*)className;

//创建一个新的实体
+(HSDBaseEtt*) createEntity;

//根据where条件查询实体
+(NSArray*) selectEntityWithWhere:(NSString*) where;

/**
 *  根据条件升序查询
 *
 *  @param where 条件
 *  @param key   排序字段
 *
 *  @return
 */
+(NSArray*) selectEntityWithWhere:(NSString*) where byAsc:(NSString *)key;
/**
 *  根据条件降序查询
 *
 *  @param where 条件
 *  @param key   排序字段
 *
 *  @return
 */
+(NSArray*) selectEntityWithWhere:(NSString*) where byDesc:(NSString *)key;

/**
 *  根据条件分页查询
 *
 *  @param page  页码
 *  @param where 条件
 *
 *  @return
 */
+(NSArray*) getListByPage:(PageInfo*)page where:(NSString*)where;

+(NSArray*) getSortDescriptors;

//保存实体
+(void) saveEntity;
/**
 *  删除实体
 *  @param entity
 */
+(void) removeEntity:(HSDBaseEtt*) entity;
/**
 *  删除所有实体
 */
+(void) removeAll;
/**
 *  按条件删除实体
 *
 *  @param where
 */
+(void) removeWithWhere:(NSString*) where;
/**
 *  按条件删除实体保存
 *
 *  @param where
 *  @param save
 */
+(void) removeWithWhere:(NSString*) where SaveContext:(BOOL) save;

/**
 *  判断两个实体是否相等
 *
 *  @param entity 对比实体
 *
 *  @return 是否相等
 */
-(BOOL) isEqualToEntity:(BaseEtt*) entity;

@end
