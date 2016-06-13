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


+ (dispatch_source_t)showCountdownOnLabel:(UILabel *)timeLabel;

@end
