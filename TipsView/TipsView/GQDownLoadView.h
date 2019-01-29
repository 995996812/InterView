//
//  GQDownLoadView.h
//  TipsView
//
//  Created by admin on 2019/1/28.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQDownLoadView : UIView

+ (void)showLoadingTitle:(NSString *)title;

+ (void)showSuccessTitle:(NSString *)title;

+ (void)showRoomView:(void(^)(void))block;

+ (void)dissMiss;
@end


