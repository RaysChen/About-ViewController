//
//  CXSubcategoryViewController.m
//  级联菜单
//
//  Created by 陈曦 on 16/9/11.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXSubcategoryViewController.h"

@interface CXSubcategoryViewController ()
//子类别数据
@property (nonatomic, strong)NSArray *subcategories;

@end

@implementation CXSubcategoryViewController


static NSString *subcategoryID = @"subcategory";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:subcategoryID];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <CXCategoryViewControllerDelegate>

- (void)categoryViewController:(CXCategoryViewController *)categoryViewController didSelectSubcategories:(NSArray *)subcategories{

    self.subcategories = subcategories;
    
    [self.tableView reloadData];

}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subcategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:subcategoryID];
    cell.textLabel.text = self.subcategories[indexPath.row];
    return cell;
}


@end
