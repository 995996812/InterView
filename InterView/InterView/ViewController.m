//
//  ViewController.m
//  InterView
//
//  Created by admin on 2019/1/25.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "ViewController.h"
#import "GQUserDefaults+Extension.h"
#import "LoginController.h"
@interface ViewController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifications:) name:@"loginSuccess" object:nil];
}

- (void)receiveNotifications:(NSNotification *)noti{
    //根据字典反射出我们想要的类
    NSDictionary *dict = noti.userInfo;
    Class class = NSClassFromString(dict[@"className"]);
    UIViewController *vc = [[class alloc] init];
    //获取参数列表
    NSDictionary *params = dict[@"property"];
    
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([vc respondsToSelector:NSSelectorFromString(key)]) {
            [vc setValue:obj forKey:key];
        }
    }];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    SEL selector = NSSelectorFromString(dict[@"method"]);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([vc respondsToSelector:selector]) {

        [vc performSelector:selector];
    }
#pragma clang diagnostic pop
}

- (void)clickFirstViewController:(id)sender {
    if ([GQUserDefaults standardUserDefaults].isLogin) {
        
        return;
    }
    LoginController *controller = [LoginController new];
    controller.controllerStr = @"FirstViewController";
    [self.navigationController pushViewController:controller animated:YES];

}
- (void)clickSecondViewController:(id)sender {
    if ([GQUserDefaults standardUserDefaults].isLogin) {
        return;
    }
    LoginController *controller = [LoginController new];
    controller.controllerStr = @"SecondViewController";
    [self.navigationController pushViewController:controller animated:YES];
}

- (UIButton *)button1{
    if (!_button1) {
        _button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
        [_button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button1 setTitle:@"FirstViewController" forState:UIControlStateNormal];
        [_button1 addTarget:self action:@selector(clickFirstViewController:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

- (UIButton *)button2{
    if (!_button2) {
        _button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 200, 50)];
        [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button2 setTitle:@"SecondViewController" forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(clickSecondViewController:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

@end
