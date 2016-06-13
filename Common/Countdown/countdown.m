//
//  countdown.m
//  TestTabBar
//
//  Created by zhao on 16/6/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "countdown.h"

static NSMutableDictionary *timeIntervalDict;

@implementation countdown


+ (dispatch_source_t)startTimerWithKey:(NSString *)timeKey andLabel:(UILabel *)timeLabel
{
    if(!timeIntervalDict)
    {
        timeIntervalDict = [NSMutableDictionary dictionary];
    }
    [timeIntervalDict setObject:@(CFAbsoluteTimeGetCurrent()) forKey:timeKey];
    
    return [self showCountdownWithKey:timeKey OnLabel:timeLabel];
}


+ (dispatch_source_t)showCountdownWithKey:(NSString *)timeKey OnLabel:(UILabel *)timeLabel
{
   __block NSTimeInterval leftTime = 60 - CFAbsoluteTimeGetCurrent() + [[timeIntervalDict objectForKey:timeKey] doubleValue];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 *NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        
        if(leftTime <= 0)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                timeLabel.userInteractionEnabled = YES;
                timeLabel.text = @"重新获取";
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                timeLabel.text = [NSString stringWithFormat:@"%.0f", leftTime];
                timeLabel.userInteractionEnabled = NO;
            });
        }
        
        leftTime--;
    });
    //启动
    dispatch_resume(timer);
    
    return timer;
}

+ (void)invalidate
{
    //dispatch_source_cancel();
}

@end
