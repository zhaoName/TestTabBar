//
//  GuideViewController.h
//  TestTabBar
//
//  Created by zhao on 16/6/13.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController

@property (nonatomic, strong) void (^guideBlock) (void);

@end
