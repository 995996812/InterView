//
//  ViewController.m
//  JavaScriptBridgeDemo
//
//  Created by admin on 2019/3/28.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"
#import <WebViewJavascriptBridge.h>

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) WebViewJavascriptBridge *bridge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [self.webView loadHTMLString:appHtml baseURL:baseURL];
    //开启日志
//    [WebViewJavascriptBridge enableLogging];
    
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [self.bridge setWebViewDelegate:self];
    
    //表单填写完成回来的回调
    [self.bridge registerHandler:@"formCompletion" handler:^(id data, WVJBResponseCallback responseCallback) {
        
        NSLog(@"表单填写完成回来的数据 %@", data);
        
    }];
    
    [self.bridge registerHandler:@"agreeResult" handler:^(id data, WVJBResponseCallback responseCallback) {
        
        NSLog(@"是否同意协议 %@", data);
        
    }];
}

- (IBAction)renderPageHtml:(UIButton *)sender {
    
    
    [self.bridge callHandler:@"sendRenderData" data:@{@"11":@"22",
                                                      @"33":@"44",
                                                      @"55":@"66"
                                                      } responseCallback:^(id responseData) {
                                                          NSLog(@"给JS发送过去的JSON数据  %@",responseData);
                                                      }];
}



@end
