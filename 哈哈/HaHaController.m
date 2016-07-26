//
//  HaHaController.m
//  TestTabBar
//
//  Created by zhao on 16/6/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "HaHaController.h"
#import <MJRefresh.h>

@interface HaHaController ()

@end

@implementation HaHaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题颜色和大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    //设置导航栏背景色
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    
    //设置导航栏样式（只有白色和黑色）
    //self.navigationController.navigationBar.barStyle =  UIBarStyleDefault;
    
    //设置状态栏字体颜色
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.name = @"fuck";
    
    [self createRefreshHeader];
}


- (void)createRefreshHeader
{
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
       
        
        
    }];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
