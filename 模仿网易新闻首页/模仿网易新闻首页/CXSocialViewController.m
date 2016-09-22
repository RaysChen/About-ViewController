//
//  CXSocialViewController.m
//  模仿网易新闻首页
//
//  Created by 陈曦 on 16/9/22.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXSocialViewController.h"

@interface CXSocialViewController ()

@end


@implementation CXSocialViewController


static NSString *ID = @"social";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@ - viewDidLoad",self.title);
    
    
    
   }



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", self.title, indexPath.row];
   
    
    return cell;
}



@end
