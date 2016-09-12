//
//  CXCategoryViewController.h
//  级联菜单
//
//  Created by 陈曦 on 16/9/11.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXCategoryViewController;

@protocol CXCategoryViewControllerDelegate <NSObject>
@optional


- (void)categoryViewController:(CXCategoryViewController *)categoryViewController didSelectSubcategories:(NSArray *)subcategories;

@end

@interface CXCategoryViewController : UITableViewController
@property (nonatomic, weak) id<CXCategoryViewControllerDelegate> delegate;
@end
