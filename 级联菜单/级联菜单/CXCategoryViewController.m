//
//  CXCategoryViewController.m
//  级联菜单
//
//  Created by 陈曦 on 16/9/11.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXCategoryViewController.h"
#import "CXCategory.h"

@interface CXCategoryViewController ()

//所有子类别的数据
@property (nonatomic, strong) NSArray *categories;
@end

@implementation CXCategoryViewController


//加载模型
- (NSArray *)catagories{

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

static  NSString*categoryID = @"category";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:categoryID];
    
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.catagories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryID];
    CXCategory *c = self.categories[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:c.icon];
    cell.imageView.highlightedImage = [UIImage imageNamed:c.highlighted_icon];
    
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    cell.textLabel.text = c.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
    
}

#pragma mark - <代理方法>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 告诉代理
    if ([self.delegate respondsToSelector:@selector(categoryViewController:didSelectSubcategories:)]) {
        CXCategory *c = self.categories[indexPath.row];
        [self.delegate categoryViewController:self didSelectSubcategories:c.subcategories];
    }
}





@end
