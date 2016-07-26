//
//  countdown.m
//  TestTabBar
//
//  Created by zhao on 16/6/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "countdown.h"

static NSMutableDictionary *timeIntervalDict;
static NSMutableDictionary *timerDict;

@implementation countdown


+ (dispatch_source_t)startTimerWithKey:(NSString *)timeKey andLabel:(UILabel *)timeLabel
{
    if(!timeIntervalDict)
    {
        timeIntervalDict = [NSMutableDictionary dictionary];
    }
    if(!timerDict)
    {
        timerDict = [NSMutableDictionary dictionary];
    }
    [timeIntervalDict setObject:@(CFAbsoluteTimeGetCurrent()) forKey:timeKey];
    
    return [self showCountdownWithKey:timeKey OnLabel:timeLabel forceStart:YES];
}


+ (dispatch_source_t)showCountdownWithKey:(NSString *)timeKey OnLabel:(UILabel *)timeLabel forceStart:(BOOL)forceStart
{
    //倒计时时间长度
   __block NSTimeInterval leftTime = 20 - CFAbsoluteTimeGetCurrent() + [[timeIntervalDict objectForKey:timeKey] doubleValue];
    if(!forceStart && leftTime <= 0) return nil;
    
    //创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0*NSEC_PER_SEC, 0.0);//每秒执行一次
    
    dispatch_source_set_event_handler(timer, ^{
        
        if(leftTime < 0)//倒计时结束
        {
            dispatch_source_cancel(timer);//必须加这句代码 否则定时器不工作
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                timeLabel.userInteractionEnabled = YES;
                timeLabel.backgroundColor = [UIColor colorWithRed:30/255.0 green:150/255.0 blue:160/255.0 alpha:1];
                timeLabel.text = @"重新获取";
            });
        }
        else//倒计时进行中
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                timeLabel.text = [NSString stringWithFormat:@"%.0f", leftTime];
                timeLabel.backgroundColor = [UIColor colorWithRed:80/255.0 green:160/255.0 blue:160/255.0 alpha:1];
                timeLabel.userInteractionEnabled = NO;
            });
            leftTime--;
        }
    });
    
    [timerDict setObject:timer forKey:@"timer"];
    dispatch_resume(timer);//启动定时器
    
    return timer;
}

//取消定时器
+ (void)invalidate
{
    dispatch_source_t timer = timerDict[@"timer"];
    
    if(timer)
    {
        dispatch_source_cancel(timer);
        [timerDict removeObjectForKey:@"timer"];
    }
}

@end
