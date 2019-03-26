//
//  GQShareViewCell.h
//  superMovie
//
//  Created by admin on 2019/3/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GQShareViewCellIdentifier @"GQShareViewCellIdentifier"

NS_ASSUME_NONNULL_BEGIN

@interface GQShareViewCell : UICollectionViewCell


- (void)configImage:(NSString *)imageName title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
