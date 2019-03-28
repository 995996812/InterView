//
//  GQShareView.m
//  superMovie
//
//  Created by admin on 2019/3/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "GQShareView.h"
#import <Masonry.h>
#import "GQShareViewCell.h"

#define kScreenHeight         [UIScreen mainScreen].bounds.size.height                          //屏幕高度
#define kScreenWidth          [UIScreen mainScreen].bounds.size.width                           //屏幕宽度

@interface GQShareView()<UICollectionViewDelegate, UICollectionViewDataSource>
//底部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shareViewHeightConstraint;

@property (nonatomic, strong)NSMutableArray * imageNameList; //分享菜单图片名字
@property (nonatomic, strong)NSMutableArray * titleNameList; //分享菜单title

@end
@implementation GQShareView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
 
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {

    }
    return self;
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kScreenWidth / 3, 78);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"GQShareViewCell" bundle:nil] forCellWithReuseIdentifier:GQShareViewCellIdentifier];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //图片名字
//    if (如果没有安装微信) {
//        _imageNameList =[[NSMutableArray alloc] initWithArray:@[
//                                                                @"share_4.0_sina",
//                                                                @"share_4.0_qqfriend",
//                                                                @"share_4.0_qqSpace",
//                                                                @"shar_4.0_copylink"]];
//        //平台名字
//        _titleNameList = [[NSMutableArray alloc] initWithArray: @[
//                                                                  @"微博",
//                                                                  @"QQ好友",
//                                                                  @"QQ空间",
//                                                                  @"拷贝链接"]];
//    }else if(如果没有安装微博){
//        _imageNameList =[[NSMutableArray alloc] initWithArray:@[@"share_4.0_wechat",
//                                                                @"share_4.0_wxfriends",
//                                                                @"share_4.0_qqfriend",
//                                                                @"share_4.0_qqSpace",
//                                                                @"shar_4.0_copylink"]];
//        //平台名字
//        _titleNameList = [[NSMutableArray alloc] initWithArray: @[@"微信好友",
//                                                                  @"微信朋友圈",
//                                                                  @"QQ好友",
//                                                                  @"QQ空间",
//                                                                  @"拷贝链接"]];
//    }else if(如果没有安装QQ){
//        _imageNameList =[[NSMutableArray alloc] initWithArray:@[@"share_4.0_wechat",
//                                                                @"share_4.0_wxfriends",
//                                                                @"share_4.0_sina",
//                                                                @"shar_4.0_copylink"]];
//        //平台名字
//        _titleNameList = [[NSMutableArray alloc] initWithArray: @[@"微信好友",
//                                                                  @"微信朋友圈",
//                                                                  @"微博",
//                                                                  @"拷贝链接"]];
//    }else if(如果没有安装QQ和微信){
//        _imageNameList =[[NSMutableArray alloc] initWithArray:@[
//                                                                @"share_4.0_sina",
//                                                                @"shar_4.0_copylink"]];
//        //平台名字
//        _titleNameList = [[NSMutableArray alloc] initWithArray: @[
//                                                                  @"微博",
//                                                                  @"拷贝链接"]];
//    }else if(如果没有安装QQ和微博){
//        _imageNameList =[[NSMutableArray alloc] initWithArray:@[@"share_4.0_wechat",
//                                                                @"share_4.0_wxfriends",
//                                                                @"shar_4.0_copylink"]];
//        //平台名字
//        _titleNameList = [[NSMutableArray alloc] initWithArray: @[@"微信好友",
//                                                                  @"微信朋友圈",
//                                                                  @"拷贝链接"]];
//    }else if(如果没有安装微信和微博){
//        _imageNameList =[[NSMutableArray alloc] initWithArray:@[
//                                                                @"share_4.0_qqfriend",
//                                                                @"share_4.0_qqSpace",
//                                                                @"shar_4.0_copylink"]];
//        //平台名字
//        _titleNameList = [[NSMutableArray alloc] initWithArray: @[
//                                                                  @"QQ好友",
//                                                                  @"QQ空间",
//                                                                  @"拷贝链接"]];
//    }else if(都装了){
    
        _imageNameList =[[NSMutableArray alloc] initWithArray:@[@"share_4.0_wechat",
                                                                @"share_4.0_wxfriends",
                                                                @"share_4.0_sina",
                                                                @"share_4.0_qqfriend",
                                                                @"share_4.0_qqSpace",
                                                                @"shar_4.0_copylink"]];
        //平台名字
        _titleNameList = [[NSMutableArray alloc] initWithArray: @[@"微信好友",
                                                                  @"微信朋友圈",
                                                                  @"微博",
                                                                  @"QQ好友",
                                                                  @"QQ空间",
                                                                  @"拷贝链接"]];
    //    }else if(都没装){
    //    _imageNameList =[[NSMutableArray alloc] initWithArray:@[@"shar_4.0_copylink"]];
    //    _titleNameList = [[NSMutableArray alloc] initWithArray: @[@"拷贝链接"]];
    //}
    
    if (_imageNameList.count <= 3) {
        
        self.shareViewHeightConstraint.constant = 125;
    }else{
        
        self.shareViewHeightConstraint.constant = 200;
    }
    
}

//MARK  - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
 
    return self.titleNameList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GQShareViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GQShareViewCellIdentifier forIndexPath:indexPath];
    
    [cell configImage:self.imageNameList[indexPath.item] title:self.titleNameList[indexPath.item]];
    
    return cell;
}

//MARK  - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *title = self.titleNameList[indexPath.item];
    
    if ([title isEqualToString:@"微信好友"]) {
        NSLog(@"微信好友");
    }else if([title isEqualToString:@"微信朋友圈"]){
        NSLog(@"微信朋友圈");
    }else if([title isEqualToString:@"微博"]){
        NSLog(@"微博");
    }else if([title isEqualToString:@"QQ好友"]){
        NSLog(@"QQ好友");
    }else if([title isEqualToString:@"QQ空间"]){
        NSLog(@"QQ空间");
    }else if([title isEqualToString:@"拷贝链接"]){
        NSLog(@"拷贝链接");
    }
    
}

/*
 utm_source=wechat&utm_medium=voguemini_ios&utm_campaign=client_share  微信好友
 utm_source=wechat&utm_medium=voguemini_ios&utm_campaign=client_share  微信朋友圈
 utm_source=weibo&utm_medium=voguemini_ios&utm_campaign=client_share   新浪微博
 utm_source=qq&utm_medium=voguemini_ios&utm_campaign=client_share      qq好友
 utm_source=qqzone&utm_medium=voguemini_ios&utm_campaign=client_share  qq空间
 */
//微信好友分享
//- (void)wechatShare{
//
//
//    CNShareModel * model = [[CNShareModel alloc]init];
//    model.weChatModel = [[CNShareWeChatModel alloc]init];
//    model.weChatModel.weChatTitle = self.shareTitle;
//    model.weChatModel.weChatText = self.shareDesc;
//    model.weChatModel.weChatImage = self.shareImage;
//    model.weChatModel.weChatThumbImage = self.shareImage;
//    model.weChatModel.weChatUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@?utm_source=wechat&utm_medium=mygq_ios&utm_campaign=client_share",self.shareUrl]];
//    model.weChatModel.weChatPlatformSubType = SSDKPlatformSubTypeWechatSession;
//    model.weChatModel.weChatType = SSDKContentTypeAuto;
//    [[CNShareSDKManager shareSDKManager] shareWithCNShareModel:model.weChatModel withCompleteBlock:^(SSDKResponseState state) {
//
//        switch (state) {
//            case SSDKResponseStateSuccess:
//            {
//                [self shareSuccess];
//            }
//                break;
//
//            default:
//                break;
//        }
//
//    }];
//}
//
////微信朋友圈
//- (void)wechatFriendsShare
//{
//
//    CNShareModel * model = [[CNShareModel alloc]init];
//    model.weChatModel = [[CNShareWeChatModel alloc]init];
//    model.weChatModel.weChatText = self.shareDesc;
//    model.weChatModel.weChatTitle = self.shareTitle;
//    model.weChatModel.weChatImage = self.shareImage;
//    model.weChatModel.weChatThumbImage = self.shareImage;
//    model.weChatModel.weChatUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@?utm_source=wechat&utm_medium=mygq_ios&utm_campaign=client_share",self.shareUrl]];
//    model.weChatModel.weChatPlatformSubType = SSDKPlatformSubTypeWechatTimeline;
//    model.weChatModel.weChatType = SSDKContentTypeAuto;
//    [[CNShareSDKManager shareSDKManager] shareWithCNShareModel:model.weChatModel withCompleteBlock:^(SSDKResponseState state) {
//        switch (state) {
//            case SSDKResponseStateSuccess:
//            {
//                [self shareSuccess];
//            }
//                break;
//
//            default:
//                break;
//        }
//    }];
//
//}
//
////新浪微博
//- (void)sinaShare{
//
//    CNShareModel * model = [[CNShareModel alloc]init];
//    model.sinaModel = [[CNShareSinaModel alloc]init];
//    //    model.sinaModel.sinaTitle = self.shareTitle;
//    model.sinaModel.sinaText = [NSString stringWithFormat:@"%@:%@?utm_source=weibo&utm_medium=mygq_ios&utm_campaign=client_share",self.shareTitle, self.shareUrl];
//    //    model.sinaModel.sinaText = self.shareDesc;
//    model.sinaModel.sinaImage = self.shareImage;
//    //    model.sinaModel.sinaUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@?utm_source=gq24&utm_medium=app&utm_content=weibo&utm_campaign=ios",self.shareUrl]];
//    [[CNShareSDKManager shareSDKManager] shareWithCNShareModel:model.sinaModel withCompleteBlock:^(SSDKResponseState state) {
//        switch (state) {
//            case SSDKResponseStateSuccess:
//            {
//                [self shareSuccess];
//            }
//                break;
//
//            default:
//                break;
//        }
//    }];
//
//}
//
////qq好友
//- (void)qqFirendsShare{
//
//    CNShareModel * model = [[CNShareModel alloc]init];
//    model.qqModel = [[CNShareQQModel alloc]init];
//    model.qqModel.qqTitle = self.shareTitle;
//    model.qqModel.qqText = self.shareDesc;
//    model.qqModel.qqImage = self.shareImage;
//    model.qqModel.qqUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@?utm_source=qq&utm_medium=mygq_ios&utm_campaign=client_share",self.shareUrl]];
//    model.qqModel.qqPlatformSubType = SSDKPlatformSubTypeQQFriend;
//    model.qqModel.qqType = SSDKContentTypeAuto;
//    [[CNShareSDKManager shareSDKManager] shareWithCNShareModel:model.qqModel withCompleteBlock:^(SSDKResponseState state) {
//        switch (state) {
//            case SSDKResponseStateSuccess:
//            {
//                [self shareSuccess];
//            }
//                break;
//
//            default:
//                break;
//        }
//    }];
//
//}
////qq空间
//- (void)qqSpaceShare{
//
//    CNShareModel * model = [[CNShareModel alloc] init];
//    model.qqModel = [[CNShareQQModel alloc] init];
//    model.qqModel.qqTitle = self.shareTitle;
//    model.qqModel.qqText = self.shareDesc;
//    model.qqModel.qqImage = self.shareImage;
//    //http://m.gq.com.cn/digital/news_1714d61677046a61.html?utm_source=gq24&utm_medium=app&utm_content=wechat&utm_campaign=ios
//    model.qqModel.qqUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@?utm_source=qqzone&utm_medium=mygq_ios&utm_campaign=client_share",self.shareUrl]];
//    model.qqModel.qqPlatformSubType = SSDKPlatformSubTypeQZone;
//    model.qqModel.qqType = SSDKContentTypeAuto;
//    [[CNShareSDKManager shareSDKManager] shareWithCNShareModel:model.qqModel withCompleteBlock:^(SSDKResponseState state) {
//        switch (state) {
//            case SSDKResponseStateSuccess:
//            {
//                [self shareSuccess];
//            }
//                break;
//
//            default:
//                break;
//        }
//    }];
//}



//取消分享视图
- (IBAction)cancelShareview:(UIButton *)sender {
    self.bottomConstraint.constant = -200;
    [UIView animateWithDuration:0.25 animations:^{

        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showShareView{
    
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ //解决动画会产生偏移的问题
        self.bottomConstraint.constant = 0;
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    });

}



@end
