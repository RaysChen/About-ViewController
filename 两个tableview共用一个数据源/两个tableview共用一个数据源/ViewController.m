//
//  ViewController.m
//  两个tableview共用一个数据源
//
//  Created by 陈曦 on 16/9/13.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXCategory.h"

@interface ViewController ()<UITableViewDataSource,UITabBarDelegate>

//左边表格
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
//右边表格
@property (weak, nonatomic) IBOutlet UITableView *subCategoryTableView;
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
    // 默认选中左边表格的第0行
    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
    
    self.subCategoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 左边表格
    if (tableView == self.categoryTableView) {
        static NSString *ID = @"category";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        CXCategory *c = self.categories[indexPath.row];
        
        // 设置普通图片
        cell.imageView.image = [UIImage imageNamed:c.icon];
        // 设置高亮图片（cell选中 -> cell.imageView.highlighted = YES -> cell.imageView显示highlightedImage这个图片）
        cell.imageView.highlightedImage = [UIImage imageNamed:c.highlighted_icon];
        
        // 设置label高亮时的文字颜色
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        
        cell.textLabel.text = c.name;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    } else {
        // 右边表格
        static NSString *ID = @"subcategory";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        // 获得左边表格被选中的模型
        CXCategory *c = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        cell.textLabel.text = c.subcategories[indexPath.row];
        
        return cell;
    }
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        [self.subCategoryTableView reloadData];
    }
}


@end
