//
//  GuideViewController.m
//  TestTabBar
//
//  Created by zhao on 16/6/13.
//  Copyright © 2016年 zhao. All rights reserved.
//
/**< 引导页*/
#import "GuideViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface GuideViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self playGuidePage];
}

- (void)playGuidePage
{
    for (int i=0; i<3; i++)
    {
        UIImageView *guideImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT)];
        
        guideImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"yindaoye%d", i+1]];
        
        [self.scrollView addSubview:guideImageView];
    }
    [self.view addSubview:self.scrollView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
    
    if(scrollView.contentOffset.x > WIDTH * 2 + 30)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"guide" forKey:@"guide"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        self.guideBlock();
    }
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
        //_scrollView.backgroundColor = [UIColor lightGrayColor];
    }
    return _scrollView;
}

@end
