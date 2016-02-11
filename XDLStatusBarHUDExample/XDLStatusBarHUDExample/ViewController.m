//
//  ViewController.m
//  XDLStatusBarHUDExample
//
//  Created by 徐d德林 on 16/2/11.
//  Copyright © 2016年 xudelin. All rights reserved.
//

#import "ViewController.h"
#import "XDLStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)showSuccess {
    [XDLStatusBarHUD showSuccess];
}
- (IBAction)showError {
    [XDLStatusBarHUD showError];
}
- (IBAction)showLoad {
    [XDLStatusBarHUD showLoad];
}
- (IBAction)showWord {
    [XDLStatusBarHUD showWord];
}
- (IBAction)hide {
    [XDLStatusBarHUD hide];
}

@end
