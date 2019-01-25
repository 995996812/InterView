//
//  LoginController.m
//  InterView
//
//  Created by admin on 2019/1/25.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "LoginController.h"
#import "GQUserDefaults+Extension.h"
@interface LoginController ()

@property (nonatomic, strong) UIButton *loginBtn;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginBtn];
}

- (void)clickLogin{
    
    [GQUserDefaults standardUserDefaults].isLogin = YES;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccess"
                                                        object:nil
                                                      userInfo:@{
                                                                 @"className": self.controllerStr,
                                                                 @"property":@{
                                                                         @"name":@"hell",
                                                                         @"age":@"18"
                                                                         },
                                                                 @"method":@"methodDemo"
                                                                 }];
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
        [_loginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

@end
