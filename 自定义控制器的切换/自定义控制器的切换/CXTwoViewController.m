//
//  CXTwoViewController.m
//  自定义控制器的切换
//
//  Created by 陈曦 on 16/9/8.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTwoViewController.h"

@interface CXTwoViewController ()

@end

@implementation CXTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


//打印看看控制器是不是死了
- (void)dealloc{
   
    NSLog(@"CXTwoViewController---dealloc");


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
