//
//  FirstViewController.m
//  InterView
//
//  Created by admin on 2019/1/25.
//  Copyright © 2019年 admin. All rights reserved.
//
/*
 需求:
 点击FirstController之前先判断用户是否登录,如果未登录,先登录,登录成功之后返回要直接打开FirstViewController
 */
#import "FirstViewController.h"
#import "GQUserDefaults+Extension.h"
@interface FirstViewController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *age;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)methodDemo{
    
    NSLog(@"名字为: %@, 年龄为: %@",self.name,self.age);
    
    [GQUserDefaults standardUserDefaults].isLogin = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
