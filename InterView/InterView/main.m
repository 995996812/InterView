//
//  main.m
//  InterView
//
//  Created by admin on 2019/1/25.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        void(^testBlock)(void) = ^(){
            
        };
        testBlock();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
