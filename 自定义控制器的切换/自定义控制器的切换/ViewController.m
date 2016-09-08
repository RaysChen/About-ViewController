//
//  ViewController.m
//  自定义控制器的切换
//
//  Created by 陈曦 on 16/9/8.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXOneViewController.h"
#import "CXTwoViewController.h"
#import "CXThreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//点击按钮1的时候调用
- (IBAction)oneClick {
    CXOneViewController *one = [[CXOneViewController alloc] init];
    one.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:one.view];
}

//点击按钮2的时候调用
- (IBAction)twoClick {
    CXTwoViewController *two = [[CXTwoViewController alloc]init];
    two.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:two.view];
}

//点击按钮3的时候调用
- (IBAction)threeClick {
    CXThreeViewController *three = [[CXThreeViewController alloc] init];
    three.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:three.view];
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
