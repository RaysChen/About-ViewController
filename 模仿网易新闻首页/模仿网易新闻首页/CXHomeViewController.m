//
//  CXHomeViewController.m
//  模仿网易新闻首页
//
//  Created by 陈曦 on 16/9/20.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXHomeViewController.h"
#import "CXSocialViewController.h"

@interface CXHomeViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation CXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //添加子控制器
    [self setupChildVc];
    
    //添加标题
    [self setupTitle];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *添加子控制器
 */
- (void)setupChildVc{

    CXSocialViewController *social0 = [[CXSocialViewController alloc] init];
    social0.title = @"国际";
    [self addChildViewController:social0];
    
    CXSocialViewController *social1 = [[CXSocialViewController alloc] init];
    social1.title = @"军事";
    [self addChildViewController:social1];
    
    CXSocialViewController *social2 = [[CXSocialViewController alloc] init];
    social2.title = @"社会";
    [self addChildViewController:social2];
    
    CXSocialViewController *social3 = [[CXSocialViewController alloc] init];
    social3.title = @"政治";
    [self addChildViewController:social3];
    
    CXSocialViewController *social4 = [[CXSocialViewController alloc] init];
    social4.title = @"经济";
    [self addChildViewController:social4];
    
    CXSocialViewController *social5 = [[CXSocialViewController alloc] init];
    social5.title = @"体育";
    [self addChildViewController:social5];
    
    CXSocialViewController *social6 = [[CXSocialViewController alloc] init];
    social6.title = @"娱乐";
    [self addChildViewController:social6];


}




/**
 * 添加标题
 */
- (void)setupTitle
{
    // 定义临时变量
    CGFloat labelW = 100;
    CGFloat labelY = 0;
    CGFloat labelH = self.titleScrollView.frame.size.height;
    
    // 添加label
    for (NSInteger i = 0; i<7; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"国际"];
        CGFloat labelX = i * labelW;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
        label.userInteractionEnabled = YES;
        label.tag = i;
        [self.titleScrollView addSubview:label];
    }
    
    // 设置contentSize
    self.titleScrollView.contentSize = CGSizeMake(7 * labelW, 0);
    self.contentScrollView.contentSize = CGSizeMake(7 * self.contentScrollView.frame.size.width, 0);
}

/**
 * 监听顶部label点击
 */
- (void)labelClick:(UITapGestureRecognizer *)tap
{
    //    [self.titleScrollView.subviews indexOfObject:tap.view];
    // 取出被点击label的索引
    NSInteger index = tap.view.tag;
    
    // 让底部的内容scrollView滚动到对应位置
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = index * self.contentScrollView.frame.size.width;
    [self.contentScrollView setContentOffset:offset animated:YES];
}
@end
