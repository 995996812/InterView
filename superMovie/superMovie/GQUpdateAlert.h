//
//  GQUpdateAlert.h
//  superMovie
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

/** App id */
#define APP_ID @"515572395"

/** RGB */
#define SELColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
/** 屏幕高度 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//屏幕适配
/**当前设备对应375的比例*/
#define Ratio_375 (SCREEN_WIDTH/375.0)
/**转换成当前比例的数*/
#define Ratio(x) ((int)((x) * Ratio_375))

/** 入场出场动画时间 */
UIKIT_EXTERN const CGFloat AlertAnimationTimeInterval;

/** 更新内容显示字体大小 */
UIKIT_EXTERN const CGFloat AlertDescriptionFont;

/** 更新内容最大显示高度 */
UIKIT_EXTERN const CGFloat AlertMaxDescriptionHeight;

@interface GQUpdateAlert : UIView


/**
 添加版本更新提示
 
 @param version 版本号
 @param descriptions 版本更新内容（数组）
 
 descriptions 格式如 @[@"1.xxxxxx",@"2.xxxxxx"]
 */
+ (void)showUpdateAlertWithVersion:(NSString *)version Descriptions:(NSArray *)descriptions;

/**
 添加版本更新提示
 
 @param version 版本号
 @param description 版本更新内容（字符串）
 
 description 格式如 @"1.xxxxxx\n2.xxxxxx"
 */
+ (void)showUpdateAlertWithVersion:(NSString *)version Description:(NSString *)description;

@end

