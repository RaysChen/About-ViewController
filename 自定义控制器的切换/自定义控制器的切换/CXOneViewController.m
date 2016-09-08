//
//  CXOneViewController.m
//  自定义控制器的切换
//
//  Created by 陈曦 on 16/9/8.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXOneViewController.h"

@interface CXOneViewController ()

@end

@implementation CXOneViewController


NSString *ID = @"one";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"one---%zd",indexPath.row];
    
    return cell;
}


@end
