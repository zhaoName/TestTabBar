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

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LoginViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) UIScrollView *scrollView;

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
    
    [self playGuidePage];
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


- (void)playGuidePage
{
    [self.view addSubview:self.scrollView];
    for (int i=0; i<3; i++)
    {
        UIImageView *guideImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT)];
        
        guideImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"yindaoye%d", i+1]];
        
        [self.scrollView addSubview:guideImageView];
    }
    
    [self.scrollView bringSubviewToFront:self.view];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark -- 登录/注册
- (IBAction)touchLoginButton:(UIButton *)sender
{
    if(self.phoneTextField.text && self.passwordTextField.text)
    {
        [[NSUserDefaults standardUserDefaults] setObject:self.phoneTextField.text forKey:@"phone"];
        [[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.text forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
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

- (UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        _scrollView.contentSize = CGSizeMake(WIDTH * 3, HEIGHT);
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor lightGrayColor];
    }
    return _scrollView;
}

//点击空白处键盘会自动收起
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
