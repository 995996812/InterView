//
//  GQShareView.h
//  superMovie
//
//  Created by admin on 2019/3/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQShareView : UIView

@property (nonatomic, copy) NSString * article_id;

//分享标题
@property (copy, nonatomic) NSString *shareTitle;
//分享描述
@property (copy, nonatomic) NSString *shareDesc;
//分享图
@property (copy, nonatomic) NSString *shareImage;
//分享url
@property (copy, nonatomic) NSString *shareUrl;

/* 用于统计*/
//被分享的文章或者装扮id
@property (copy, nonatomic) NSString *trackerId;
//被分享的文章或者装扮名称
@property (copy, nonatomic) NSString *trackertitle;
//频道名称
@property (copy, nonatomic) NSString *trakcerChannel;


/**
 显示分享视图
 */
- (void)showShareView;

@end


