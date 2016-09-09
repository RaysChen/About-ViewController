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

//@property (nonatomic,strong) CXOneViewController *one;
//@property (nonatomic,strong) CXTwoViewController *two;
//@property (nonatomic,strong) CXThreeViewController *three;

//正在显示控制器
@property (nonatomic, weak) UIViewController *showVc;

//用来存放子控制器的view
@property (nonatomic, weak) UIView *contentView;

//存放控制器的数组
//@property (nonatomic, strong) NSArray *allVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *contentView = [[UIView alloc]init];
    contentView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
   /* self.allVc = @[
                   [[CXOneViewController alloc]init],
                   [[CXTwoViewController alloc]init],
                   [[CXThreeViewController alloc]init]
                   ];
    */
    
    
    // 通过addChildViewController添加的控制器都会存在于childViewControllers数组中
    [self addChildViewController:[[CXOneViewController alloc]init]];
    [self addChildViewController:[[CXTwoViewController alloc]init]];
    [self addChildViewController:[[CXThreeViewController alloc]init]];
    
    // 将CXOneViewController从childViewControllers数组中移除
    //    [self.childViewControllers[0] removeFromParentViewController];


    
}


- (IBAction)buttonClick:(UIButton *)button {
    //移除其他控制器view
    [self.showVc.view removeFromSuperview];
    
    //获得控制器的位置（索引）（拿出按钮的父控件的数组，看下按钮在数组中的位置）
     NSUInteger index = [button.superview.subviews indexOfObject:button];
    
    // 当前控制器的索引
    NSUInteger oldIndex = [self.childViewControllers indexOfObject:self.showVc];

    
    //添加控制器的view
    self.showVc = self.childViewControllers[index];
    self.showVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.showVc.view];
    
    //动画
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = index > oldIndex ? kCATransitionFromRight : kCATransitionFromLeft;
    animation.duration = 0.5;
    [self.contentView.layer addAnimation:animation forKey:nil];


}


/*
//点击按钮1的时候调用
- (IBAction)oneClick {
    //创建控制器
    if (self.one == nil) {
        
        self.one = [[CXOneViewController alloc] init];
        self. one.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);

    }
    //移除其他的控制器view
    [self.two.view removeFromSuperview];
    [self.three.view removeFromSuperview];
    
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
    
    //移除其他控制器的view
    [self.one.view removeFromSuperview];
    [self.three.view removeFromSuperview];
   
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
    
    //移除其他控制器的view
    [self.one.view removeFromSuperview];
    [self.two.view removeFromSuperview];
    
    //添加控制器的view
    [self.view addSubview:self.three.view];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
 */

/**
 *  有问题
 1.控制器重复创建了 slu
 2.控制器死了，view还在啊。。slu
 
 新问题
 3个控制器的view 同时出现了
 */
@end
