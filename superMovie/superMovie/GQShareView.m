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
    
    [self configUI];
}

//MARK  - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
 
    return self.titleNameList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GQShareViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GQShareViewCellIdentifier forIndexPath:indexPath];
    
    
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



- (void)configUI{
    
    self.bottomConstraint.constant = 0;
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
