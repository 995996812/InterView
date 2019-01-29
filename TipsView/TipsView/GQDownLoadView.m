//
//  GQDownLoadView.m
//  TipsView
//
//  Created by admin on 2019/1/28.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "GQDownLoadView.h"
#import "UIView+Helper.h"
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define kTipMargin 36
#define kRoomHeight 151

@interface GQDownLoadView()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, copy) void(^backBlock)(void);

@end

@implementation GQDownLoadView

+ (void)showLoadingTitle:(NSString *)title{
    
    [GQDownLoadView createView].label.text = title;
}

+ (void)showSuccessTitle:(NSString *)title{
    
    [GQDownLoadView createView].label.text = title;
}

+ (void)showRoomView:(void(^)(void))block{
    [[GQDownLoadView createView] addRoomView];
    
    [GQDownLoadView createView].backBlock = block;
}

+ (void)dissMiss{
    [[GQDownLoadView createView] removeAllView];
}

- (void)removeAllView{
    [self.bgView removeFromSuperview];
    [self.label removeFromSuperview];
    [self.btn removeFromSuperview];
    [self.imgView removeFromSuperview];
    
    self.bgView = nil;
    self.label = nil;
    self.btn = nil;
    self.imgView = nil;
    
    [self removeFromSuperview];
    
}

- (void)addRoomView{
    [self.label removeFromSuperview];
    self.label = nil;
    
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.btn];
    [self.bgView addSubview:self.label];
    self.label.frame = CGRectMake(0, 30, self.bgView.frame.size.width, self.bgView.frame.size.height - 70);
    self.label.text = @"房间升级成功，去首页庆祝一下";
    [self.bgView addSubview:self.imgView];
    [self.imgView sizeToFit];
    self.imgView.y = -2;
    self.imgView.x = (self.bgView.width - self.imgView.width) / 2;
}

+ (instancetype)createView{
    
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([view isKindOfClass:[GQDownLoadView class]]) {
            
            return (GQDownLoadView *)view;
        }
    }
    
    GQDownLoadView *view = [[GQDownLoadView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [view addSubview:view.label];
    
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    
    return view;
}

- (void)clickBackHome:(id)sender{
    if (self.backBlock) {
        self.backBlock();
    }
}


// MARK: - lazy
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(kTipMargin, 0, kScreenWidth -  kTipMargin * 2, 60)];
        _label.center = self.center;
        _label.backgroundColor = [UIColor whiteColor];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(kTipMargin, 0, kScreenWidth -  kTipMargin * 2, kRoomHeight)];
        _bgView.center = self.center;
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.bgView.frame.size.height - 40, self.bgView.frame.size.width, 40)];
        _btn.backgroundColor = [UIColor redColor];
        _btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btn setTitle:@"返回首页" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(clickBackHome:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _imgView.image = [UIImage imageNamed:@"room.png"];
    }
    return _imgView;
}
@end
