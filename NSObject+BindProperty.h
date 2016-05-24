//
//  NSObject+BindProperty.h
//  MyCode
//
//  Created by 沈佳 on 14-12-3.
//  Copyright (c) 2014年 com.rex.shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BindProperty)

/*
 获取所有的属性名称
 */
- (NSMutableArray*)propertyKeys;

/*
 将集合中的值绑定到属性上
 */
- (BOOL)reflectDataFromDictionary:(NSDictionary*)dataSource;

- (NSDictionary*) toDictionary;

@end
