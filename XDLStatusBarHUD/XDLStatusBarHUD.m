//
//  XDLStatusBarHUD.m
//  windowForIndicator
//
//  Created by 徐d德林 on 16/2/10.
//  Copyright © 2016年 xudelin. All rights reserved.
//

#import "XDLStatusBarHUD.h"

@implementation XDLStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;
+(void)showWithMessage:(NSString *)message Image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    //显示窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    //显示view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.frame;
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:message forState:UIControlStateNormal];
    [window_ addSubview:button];
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
+(void)showSuccess
{
    [self showWithMessage:@"XDLStatusBarHUD/success" Image:[UIImage imageNamed:@"XDLStatusBarHUD/success"]];
}
+(void)showError
{
    [self showWithMessage:@"XDLStatusBarHUD/error" Image:[UIImage imageNamed:@"XDLStatusBarHUD/error"]];
}
+(void)showLoad
{
    //显示窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    //显示label
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.frame;
    label.text = @"正在加载中";
    label.font = [UIFont systemFontOfSize:12.0];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    //显示小菊花
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat textW = [label.text sizeWithAttributes:@{NSFontAttributeName:label.font}].width;
    CGFloat centerX = (window_.frame.size.width - textW) * 0.5 - 10;
    CGFloat centerY = window_.frame.size.height * 0.5;
    indicator.center = CGPointMake(centerX, centerY);
    [indicator startAnimating];
    [window_ addSubview:indicator];
    
    
}
+(void)showWord
{
    [self showWithMessage:@"fuck" Image:nil];
}
+(void)hide
{
    window_ = nil;
    timer_ = nil;
}
@end
