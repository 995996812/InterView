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
#import "GQUpdateAlert.h"
@interface ViewController ()

@property (nonatomic, strong)GQShareView *shareView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)jump:(id)sender {
    
    
    GQShareView *view = [[[NSBundle mainBundle] loadNibNamed:@"GQShareView" owner:nil options:nil] lastObject];
    
    [view showShareView];
    
}

- (IBAction)versionUpdate:(UIButton *)sender {
    
        [GQUpdateAlert showUpdateAlertWithVersion:@"1.0.0" Descriptions:@[@"1.xxxxxxxxxx",@"2.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]];
}


@end
