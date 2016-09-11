//
//  ViewController.m
//  级联菜单
//
//  Created by 陈曦 on 16/9/11.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXCategoryViewController.h"
#import "CXSubcategoryViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width * 0.5;
    CGFloat height = self.view.frame.size.height;
    
    CXSubcategoryViewController *subcategoryVc = [[CXSubcategoryViewController alloc] init];
    subcategoryVc.view.frame = CGRectMake(width, 0, width, height);
    [self addChildViewController:subcategoryVc];
    [self.view addSubview:subcategoryVc.view];
    
    CXCategoryViewController *categoryVc = [[CXCategoryViewController alloc] init];
    categoryVc.view.frame = CGRectMake(0, 0, width, height);
    [self addChildViewController:categoryVc];
    [self.view addSubview:categoryVc.view];
}


@end
