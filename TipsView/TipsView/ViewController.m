//
//  ViewController.m
//  TipsView
//
//  Created by admin on 2019/1/28.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "ViewController.h"
#import "GQDownLoadView.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showTipsView:(id)sender {
    [GQDownLoadView showLoadingTitle:@"兑换下载中，请稍后..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [GQDownLoadView showRoomView:^{
//            NSLog(@"1111111111");
//            [self showTipsView:sender];
//        }];
        [GQDownLoadView showLoadingTitle:@"下载成功"];
        [GQDownLoadView showLoadingTitle:@"下载失败，请重新下载"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [GQDownLoadView dissMiss];
        });
    });
}



@end
