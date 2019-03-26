//
//  GQUpdateAlert.m
//  superMovie
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 admin. All rights reserved.
//

#import "GQUpdateAlert.h"
/** 入场出场动画时间 */
const CGFloat AlertAnimationTimeInterval = 0.6f;

/** 更新内容显示字体大小 */
const CGFloat AlertDescriptionFont = 16;

/** 更新内容最大显示高度 */
const CGFloat AlertMaxDescriptionHeight;

#define DEFAULT_MAX_HEIGHT SCREEN_HEIGHT/3*2

@interface GQUpdateAlert()

/** 版本号 */
@property (nonatomic, copy) NSString *version;
/** 版本更新内容 */
@property (nonatomic, copy) NSString *desc;

@end

@implementation GQUpdateAlert

+ (void)showUpdateAlertWithVersion:(NSString *)version Descriptions:(NSArray *)descriptions
{
    if (!descriptions || descriptions.count == 0) {
        return;
    }
    
    //数组转换字符串，动态添加换行符\n
    NSString *description = @"";
    for (NSInteger i = 0;  i < descriptions.count; ++i) {
        id desc = descriptions[i];
        if (![desc isKindOfClass:[NSString class]]) {
            return;
        }
        description = [description stringByAppendingString:desc];
        if (i != descriptions.count-1) {
            description = [description stringByAppendingString:@"\n"];
        }
    }
    NSLog(@"====%@",description);
    GQUpdateAlert *updateAlert = [[GQUpdateAlert alloc]initVersion:version description:description];
    [[UIApplication sharedApplication].delegate.window addSubview:updateAlert];
}

+ (void)showUpdateAlertWithVersion:(NSString *)version Description:(NSString *)description
{
    GQUpdateAlert *updateAlert = [[GQUpdateAlert alloc]initVersion:version description:description];
    [[UIApplication sharedApplication].delegate.window addSubview:updateAlert];
}

- (instancetype)initVersion:(NSString *)version description:(NSString *)description
{
    self = [super init];
    if (self) {
        self.version = version;
        self.desc = description;
        
        [self _setupUI];
    }
    return self;
}

- (void)_setupUI
{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5/1.0];
    
    //获取更新内容高度
    CGFloat descHeight = [self _sizeofString:self.desc font:[UIFont systemFontOfSize:AlertDescriptionFont] maxSize:CGSizeMake(self.frame.size.width - Ratio(80) - Ratio(56), 1000)].height;
    
    //bgView实际高度
    CGFloat realHeight = descHeight + Ratio(192);
    
    //bgView最大高度
    CGFloat maxHeight = DEFAULT_MAX_HEIGHT;
    //更新内容可否滑动显示
    BOOL scrollEnabled = NO;
    
    //重置bgView最大高度 设置更新内容可否滑动显示
    if (realHeight > DEFAULT_MAX_HEIGHT) {
        scrollEnabled = YES;
        descHeight = DEFAULT_MAX_HEIGHT - Ratio(192);
    }else{
        maxHeight = realHeight;
    }
    
    //backgroundView
    UIView *bgView = [[UIView alloc]init];
    bgView.center = self.center;
    bgView.bounds = CGRectMake(0, 0, self.frame.size.width - Ratio(40), maxHeight+Ratio(18));
    [self addSubview:bgView];
    
    //添加更新提示
    UIView *updateView = [[UIView alloc]initWithFrame:CGRectMake(Ratio(20), Ratio(18), bgView.frame.size.width - Ratio(40), maxHeight)];
    updateView.backgroundColor = [UIColor whiteColor];
    updateView.layer.masksToBounds = YES;
    updateView.layer.cornerRadius = 4.0f;
    updateView.layer.borderWidth = 0.5f;
    updateView.layer.borderColor = [UIColor blackColor].CGColor;
    [bgView addSubview:updateView];
    
    //20+166+10+28+10+descHeight+20+40+20 = 200+descHeight 内部元素高度计算bgView高度
    //版本号
    UILabel *versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, updateView.frame.size.width, Ratio(50))];
    versionLabel.font = [UIFont boldSystemFontOfSize:18];
    versionLabel.backgroundColor = [UIColor orangeColor];
    versionLabel.textColor = [UIColor whiteColor];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.text = @"有新版本了!";
    [updateView addSubview:versionLabel];
    
    //更新内容
    UITextView *descTextView = [[UITextView alloc]initWithFrame:CGRectMake(Ratio(28), Ratio(10) + CGRectGetMaxY(versionLabel.frame), updateView.frame.size.width - Ratio(56), descHeight)];
    descTextView.font = [UIFont systemFontOfSize:AlertDescriptionFont];
    descTextView.textContainer.lineFragmentPadding = 0;
    descTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    descTextView.text = self.desc;
    descTextView.editable = NO;
    descTextView.selectable = NO;
    descTextView.scrollEnabled = scrollEnabled;
    descTextView.showsVerticalScrollIndicator = scrollEnabled;
    descTextView.showsHorizontalScrollIndicator = NO;
    [updateView addSubview:descTextView];
    
    if (scrollEnabled) {
        //若显示滑动条，提示可以有滑动条
        [descTextView flashScrollIndicators];
    }
    
    UIView *lineViewOne = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(descTextView.frame) + Ratio(30), updateView.frame.size.width, Ratio(1))];
    lineViewOne.backgroundColor = [UIColor blackColor];
    [updateView addSubview:lineViewOne];
    
    //更新按钮
    UIButton *updateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    updateButton.frame = CGRectMake(0, CGRectGetMaxY(lineViewOne.frame) + Ratio(5), updateView.frame.size.width, Ratio(40));
    [updateButton addTarget:self action:@selector(updateVersion) forControlEvents:UIControlEventTouchUpInside];
    [updateButton setTitle:@"立即升级" forState:UIControlStateNormal];
    [updateButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [updateView addSubview:updateButton];
    
    UIView *lineViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(updateButton.frame) + Ratio(5), updateView.frame.size.width, Ratio(1))];
    lineViewTwo.backgroundColor = [UIColor blackColor];
    [updateView addSubview:lineViewTwo];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelButton.frame = CGRectMake(0, CGRectGetMaxY(lineViewTwo.frame) + Ratio(5), updateView.frame.size.width, Ratio(40));
    [cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"暂不升级" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [updateView addSubview:cancelButton];
    
    //显示更新
    [self showWithAlert:bgView];
}

/** 更新按钮点击事件 跳转AppStore更新 */
- (void)updateVersion
{
    NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%@", APP_ID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/** 取消按钮点击事件 */
- (void)cancelAction
{
    [self dismissAlert];
}

/**
 添加Alert入场动画
 @param alert 添加动画的View
 */
- (void)showWithAlert:(UIView*)alert{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = AlertAnimationTimeInterval;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [alert.layer addAnimation:animation forKey:nil];
}


/** 添加Alert出场动画 */
- (void)dismissAlert{
    
    [UIView animateWithDuration:AlertAnimationTimeInterval animations:^{
        self.transform = (CGAffineTransformMakeScale(1.0, 1.0));
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    } ];
    
}

/**
 计算字符串高度
 @param string 字符串
 @param font 字体大小
 @param maxSize 最大Size
 @return 计算得到的Size
 */
- (CGSize)_sizeofString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
