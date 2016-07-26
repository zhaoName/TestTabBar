//
//  HeHeController.m
//  TestTabBar
//
//  Created by zhao on 16/6/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "HeHeController.h"
#import "HaHaController.h"

@interface HeHeController ()

@end

@implementation HeHeController

- (void)viewDidLoad {
    [super viewDidLoad];
    //tabbar传值
    UINavigationController *na = [self.tabBarController.viewControllers objectAtIndex:0];
    HaHaController *haha = (HaHaController *)na.visibleViewController;
    NSLog(@"%@", haha.name);
}

@end
