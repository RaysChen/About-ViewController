//
//  CXCategory.m
//  级联菜单
//
//  Created by 陈曦 on 16/9/12.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXCategory.h"

@implementation CXCategory

+ (instancetype)categoryWithDict:(NSDictionary *)dict{


    CXCategory *c = [[self alloc]init];
    [c setValuesForKeysWithDictionary:dict];
    return c;
    
}



@end
