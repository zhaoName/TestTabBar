//
//  countdown.h
//  TestTabBar
//
//  Created by zhao on 16/6/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface countdown : NSObject

/**
 *  初始化字典 开始定时器 并记录开始时间
 *
 *  @param timeKey   开始时间的key
 *  @param timeLabel 显示倒计时的label
 */
+ (dispatch_source_t)startTimerWithKey:(NSString *)timeKey andLabel:(UILabel *)timeLabel;

/**
 *  定时器工作 并显示处理业务
 *
 *  @param forceStart 是否启动定时器（第一次进入注册界面时不需要走定时器）
 */
+ (dispatch_source_t)showCountdownWithKey:(NSString *)timeKey OnLabel:(UILabel *)timeLabel forceStart:(BOOL)forceStart;

/**取消定时器*/
+ (void)invalidate;

@end
