//
//  RegisterViewController.m
//  TestTabBar
//
//  Created by zhao on 16/6/3.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "RegisterViewController.h"
#import "countdown.h"

static NSMutableDictionary *timeIntervalDict;

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (nonatomic, strong) NSTimer *timer;

- (IBAction)touchRegisterButton:(UIButton *)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.registerButton.layer.cornerRadius = 5;
    self.registerButton.clipsToBounds = YES;
    
    self.verificationCodeLabel.layer.cornerRadius = 5;
    self.verificationCodeLabel.clipsToBounds = YES;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendVerificationCode:)];
    self.verificationCodeLabel.userInteractionEnabled = YES;
    [self.verificationCodeLabel addGestureRecognizer:tap];
    
    if(!timeIntervalDict)
    {
        timeIntervalDict = [[NSMutableDictionary alloc] init];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
#if 0
    if(timeIntervalDict[@"startDate"])
    {
        self.verificationCodeLabel.text = [NSString stringWithFormat:@"%.0f", 20 - [[NSDate date] timeIntervalSinceDate:timeIntervalDict[@"startDate"]]];
        
        [self startTimer];
    }
#elif 1
    [countdown showCountdownWithKey:@"startTime" OnLabel:self.verificationCodeLabel forceStart:NO];
#endif
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
#if 0
    [self.timer invalidate];
#elif 1
    //取消GCD定时器
    [countdown invalidate];
#endif
}

- (void)sendVerificationCode:(UITapGestureRecognizer *)tap
{
#if 0
    //NSTimer定时器
    [timeIntervalDict setObject:[NSDate date] forKey:@"startDate"];
    [self startTimer];
#elif 1
    //GCD定时器
    [countdown startTimerWithKey:@"startTime" andLabel:self.verificationCodeLabel];
#endif
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cutDownTime:) userInfo:nil repeats:YES];
}

- (void)cutDownTime:(NSTimer *)time
{
    if(timeIntervalDict.count == 0) return;
    
    NSDate *startDate = timeIntervalDict[@"startDate"];
    NSTimeInterval labelTime = 20 - [[NSDate date] timeIntervalSinceDate:startDate];
    
    if(labelTime < 0)
    {
        self.verificationCodeLabel.text = [NSString stringWithFormat:@"重新获取"];
        self.verificationCodeLabel.userInteractionEnabled = YES;
        self.verificationCodeLabel.backgroundColor = [UIColor colorWithRed:30/255.0 green:150/255.0 blue:160/255.0 alpha:1];
        [timeIntervalDict removeAllObjects];
        [self.timer invalidate];
    }
    else
    {
        self.verificationCodeLabel.userInteractionEnabled = NO;
        self.verificationCodeLabel.backgroundColor = [UIColor colorWithRed:80/255.0 green:160/255.0 blue:160/255.0 alpha:1];
        self.verificationCodeLabel.text = [NSString stringWithFormat:@"%.0f", labelTime];
    }
}


- (IBAction)touchRegisterButton:(UIButton *)sender
{
    
}


//收起键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
