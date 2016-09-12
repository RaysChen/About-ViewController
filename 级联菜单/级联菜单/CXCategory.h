//
//  CXCategory.h
//  级联菜单
//
//  Created by 陈曦 on 16/9/12.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXCategory : NSObject
//子类别
@property (nonatomic, strong) NSArray *subcategories;
//姓名
@property (nonatomic, strong )NSString *name;
//图标
@property (nonatomic, strong )NSString *icon;
//高亮图标
@property (nonatomic, strong )NSString *highlighted_icon;

+ (instancetype)categoryWithDict:(NSDictionary*)dict;

@end
