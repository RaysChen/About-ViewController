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

@property (nonatomic,strong) CXOneViewController *one;
@property (nonatomic,strong) CXTwoViewController *two;
@property (nonatomic,strong) CXThreeViewController *three;

@end

@implementation ViewController

//点击按钮1的时候调用
- (IBAction)oneClick {
    //创建控制器
    if (self.one == nil) {
        
        self.one = [[CXOneViewController alloc] init];
        self. one.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);

    }
    
    //添加控制器的view
    [self.view addSubview:self.one.view];
}

//点击按钮2的时候调用
- (IBAction)twoClick {
    //创建控制器
    if (self.two == nil) {
        self.two = [[CXTwoViewController alloc]init];
        self.two.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    }
   
    //添加控制器的view
    [self.view addSubview:self.two.view];
}

//点击按钮3的时候调用
- (IBAction)threeClick {
    
    //创建控制器
    if (self.three == nil) {
        self.three = [[CXThreeViewController alloc] init];
        self.three.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);

    }
    
    //添加控制器的view
    [self.view addSubview:self.three.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  有问题
 1.控制器重复创建了 slu
 2.控制器死了，view还在啊。。slu
 
 新问题
 3个控制器的view 同时出现了
 */
@end
