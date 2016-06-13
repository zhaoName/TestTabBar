//
//  LoginViewController.m
//  TestTabBar
//
//  Created by zhao on 16/6/3.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "LoginViewController.h"
#import "HaHaController.h"
#import "RootTabBarViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

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

#pragma mark -- 登录/注册
- (IBAction)touchLoginButton:(UIButton *)sender
{
    if(self.phoneTextField.text && self.passwordTextField.text)
    {
        [[NSUserDefaults standardUserDefaults] setObject:self.phoneTextField.text forKey:@"phone"];
        [[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.text forKey:@"password"];
        
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RootTabBarViewController *rootTabBar = [board instantiateViewControllerWithIdentifier:@"RootTabBarViewController"];
        
        //模态试图推入效果
        rootTabBar.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:rootTabBar animated:YES completion:nil];
    }
}

- (IBAction)touchRegisterButton:(UIButton *)sender
{
    
}

//点击空白处键盘会自动收起
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
