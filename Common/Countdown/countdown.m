//
//  countdown.m
//  TestTabBar
//
//  Created by zhao on 16/6/7.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "countdown.h"

@implementation countdown


+ (dispatch_source_t)startTimerWithKey:(NSString *)timeKey andLabel:(UILabel *)timeLabel
{
    
    return [self showCountdownOnLabel:timeLabel];
}


+ (dispatch_source_t)showCountdownOnLabel:(UILabel *)timeLabel
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //定时
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        
        
        
    });
    //启动
    dispatch_resume(timer);
    
    
    
    return timer;
}


@end
