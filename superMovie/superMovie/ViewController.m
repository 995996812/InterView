//
//  ViewController.m
//  superMovie
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"
#import "GQShareView.h"
#import <Masonry.h>
@interface ViewController ()

@property (nonatomic, strong)GQShareView *shareView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)jump:(id)sender {
    
    [self.view addSubview:self.shareView];
    
    [self.shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
}

- (GQShareView *)shareView{
    if (!_shareView) {
         NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"GQShareView" owner:nil options:nil];
        _shareView = [nibContents lastObject];
    }
    return _shareView;
}


@end
