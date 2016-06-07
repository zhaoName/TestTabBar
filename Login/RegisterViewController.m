//
//  RegisterViewController.m
//  TestTabBar
//
//  Created by zhao on 16/6/3.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "RegisterViewController.h"

static NSMutableDictionary *timeIntervalDict;
static NSMutableDictionary *timersDict;


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
    if(!timersDict)
    {
        timersDict = [[NSMutableDictionary alloc] init];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cutDownTime:) userInfo:nil repeats:YES];
    
    [self cutDownTime: self.timer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if(timersDict)
    {
        NSTimer *timer = [timersDict objectForKey:@"timer"];
        [timer invalidate];
    }
}

- (void)sendVerificationCode:(UITapGestureRecognizer *)tap
{
    [timeIntervalDict setObject:[NSDate date] forKey:@"startDate"];
    self.verificationCodeLabel.text = [NSString stringWithFormat:@"%d", 60];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cutDownTime:) userInfo:nil repeats:YES];
    
    [timersDict setObject:self.timer forKey:@"timer"];
}

- (void)cutDownTime:(NSTimer *)time
{
    if(!timeIntervalDict)
    {
        return;
    }
    
    NSDate *startDate = timeIntervalDict[@"startDate"];
    NSTimeInterval labelTime = 60 - ([[NSDate date] timeIntervalSince1970]- [startDate timeIntervalSince1970]);
    
    self.verificationCodeLabel.text = [NSString stringWithFormat:@"%.0f", labelTime];
    
    if(labelTime < 0)
    {
        self.verificationCodeLabel.text = @"重新获取";
        [timeIntervalDict removeAllObjects];
        [self.timer invalidate];
    }
}


- (IBAction)touchRegisterButton:(UIButton *)sender
{
    
}


@end