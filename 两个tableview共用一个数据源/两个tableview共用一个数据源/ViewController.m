//
//  ViewController.m
//  两个tableview共用一个数据源
//
//  Created by 陈曦 on 16/9/13.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXCategory.h"

@interface ViewController ()

//左边表格
@property (weak, nonatomic) IBOutlet UITableView *category;
//右边表格
@property (weak, nonatomic) IBOutlet UITableView *subCategory;
//所有类别数据
@property (strong, nonatomic)NSArray *categories;

@end

@implementation ViewController

- (NSArray *)categories{
    
    if (_categories == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        
        NSMutableArray *categoryArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [categoryArray addObject:[CXCategory categoryWithDict:dict]];
        }
        _categories = categoryArray;
    }
    return _categories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
