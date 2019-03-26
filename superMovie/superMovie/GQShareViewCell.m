//
//  GQShareViewCell.m
//  superMovie
//
//  Created by admin on 2019/3/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "GQShareViewCell.h"

@interface GQShareViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *showTitle;

@end


@implementation GQShareViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configImage:(NSString *)imageName title:(NSString *)title{
    
    self.imageView.image = [UIImage imageNamed:imageName];
    self.showTitle.text = title;
    
}
@end
