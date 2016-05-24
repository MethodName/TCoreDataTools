//
//  HSDBaseEtt.m
//  HaoShiDai
//
//  Created by 沈佳 on 14-12-15.
//  Copyright (c) 2014年 shenjia. All rights reserved.
//

#import "BaseEtt.h"


@implementation BaseEtt

#pragma mark -判断两个实体是否相等
-(BOOL) isEqualToEntity:(BaseEtt*) entity
{
    return self == entity;
}

#pragma mark -类名
+(NSString*)className
{
    return @"BaseEtt";
}

#pragma mark -获取类型描述
+(NSArray*) getSortDescriptors
{
    return nil;
}

#pragma mark -创建一个实体
+(BaseEtt*) createEntity
{
    //获取appDelegate对象
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    

    //根据名字创建一个实体
    BaseEtt *ett = [NSEntityDescription insertNewObjectForEntityForName:[self className] inManagedObjectContext:app.managedObjectContext];
    
    return ett;
}

#pragma mark -根据条件查询
+(NSArray*) selectEntityWithWhere:(NSString*) where
{
    //获取appDelegate对象
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self className]];
    
    if (nil != where && ![where isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:where];
        request.predicate = predicate;
    }
    
    NSArray *ary = [app.managedObjectContext executeFetchRequest:request error:nil];
   
    return ary;
}


#pragma mark -根据条件倒序查询
+(NSArray*) selectEntityWithWhere:(NSString*) where byDesc:(NSString *)key
{
    //获取appDelegate对象
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self className]];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:key ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort, nil];
    [request setSortDescriptors:sortDescriptors];

    if (nil != where && ![where isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:where];
        request.predicate = predicate;
    }
    
    NSArray *ary = [app.managedObjectContext executeFetchRequest:request error:nil];
    
    return ary;
}


#pragma mark -根据条件升序查询
+(NSArray*) selectEntityWithWhere:(NSString*) where byAsc:(NSString *)key
{
    //获取appDelegate对象
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self className]];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort, nil];
    [request setSortDescriptors:sortDescriptors];
    
    if (nil != where && ![where isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:where];
        request.predicate = predicate;
    }
    
    NSArray *ary = [app.managedObjectContext executeFetchRequest:request error:nil];
    
    return ary;
}






#pragma mark -分页查询
+(NSArray*) getListByPage:(PageInfo*)page where:(NSString*)where
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self className]];
    
    if (nil != where && ![where isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:where];
        request.predicate = predicate;
    }
    [request setSortDescriptors:[self getSortDescriptors]];
    if (page)
    {
        [request setFetchLimit:page.pageSzie];
        [request setFetchOffset:page.pageSzie * page.pageIndex];
    }
    NSArray *ary = [app.managedObjectContext executeFetchRequest:request error:nil];
    
    return ary;
}

#pragma mark -保存实体
+(void) saveEntity
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app saveContext];
}

#pragma mark -删除所有
+(void) removeAll
{
    [self removeWithWhere:nil];
}

#pragma mark -根据条件删除
+(void) removeWithWhere:(NSString*) where
{
    [self removeWithWhere:where SaveContext:YES];
}

#pragma mark -删除单个实体
+(void) removeEntity:(BaseEtt*) entity
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.managedObjectContext deleteObject:entity];
}


#pragma mark -根据条件删除
+(void) removeWithWhere:(NSString*) where SaveContext:(BOOL) save
{
    NSArray *array = [self selectEntityWithWhere:where];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    if (array && array.count > 0)
    {
        for (BaseEtt *ett in array)
        {
            [[app managedObjectContext] deleteObject:ett];
        }
        if (save)
        {
            [app saveContext];
        }
    }
}

@end
