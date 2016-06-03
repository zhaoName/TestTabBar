//
//  LoginViewController.m
//  TestTabBar
//
//  Created by zhao on 16/6/3.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;


- (IBAction)touchLoginButton:(UIButton *)sender;
- (IBAction)touchRegisterButton:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loginBtn.layer.cornerRadius = 5.0f;
    
    self.registerBtn.layer.borderWidth = 1.0f;
    self.registerBtn.layer.cornerRadius = 5.0f;
    self.registerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.backView.layer.borderWidth = 1.0;
    self.backView.layer.cornerRadius = 5.0;
    self.backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark -- 登录注册
- (IBAction)touchLoginButton:(UIButton *)sender
{
    
}

- (IBAction)touchRegisterButton:(UIButton *)sender
{
    
}


@end
