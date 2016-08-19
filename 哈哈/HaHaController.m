//
//  HaHaController.m
//  TestTabBar
//
//  Created by zhao on 16/6/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "HaHaController.h"
#import "BackViewController.h"

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
}

/*
 导航的返回按钮的加载原理是这样的：
 
 1、如果B视图有一个自定义的左侧按钮（leftBarButtonItem），则会显示这个自定义按钮；
 2、如果B没有自定义按钮，但是A视图的backBarButtonItem属性有自定义项，则显示这个自定义项；
 3、如果前2条都没有，则默认显示一个后退按钮，后退按钮的标题是A视图的标题。
 按照这个解释，我把UIBarButtonItem *backItem……这段代码放在A视图的pushViewController语句之前。
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] init];
        leftItem.title = @"返回";
        self.navigationItem.backBarButtonItem = leftItem;
        
        //设置返回按钮的颜色
        self.navigationController.navigationBar.tintColor = [UIColor redColor];
        BackViewController *backVC = [[BackViewController alloc] init];
        [self.navigationController pushViewController:backVC animated:YES];
    }
}



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
