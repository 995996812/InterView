//
//  BlockViewController.m
//  InterView
//
//  Created by admin on 2019/1/25.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "BlockViewController.h"
#import "MyObject.h"

#define HZLog(prefix,Obj) {NSLog(@"变量内存地址：%p, 变量值：%p, 指向对象值：%@, --> %@",&Obj,Obj,Obj,prefix);}

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test2];
    
}

- (void)test3{
    
}

- (void)test2{
    MyObject *myObject = [[MyObject alloc]init];
    HZLog(@"obj", myObject); //变量内存地址：0x7ffee7686448, 变量值：0x6000000109a0, 指向对象值：<MyObject: 0x6000000109a0>, --> obj
    __weak MyObject *weakObj = myObject;
    HZLog(@"weakObj-1", weakObj); //变量内存地址：0x7ffee7686440, 变量值：0x6000000109a0, 指向对象值：<MyObject: 0x6000000109a0>, --> weakObj-1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong MyObject *strongObj = weakObj;
        HZLog(@"weakObj-block", weakObj); //变量内存地址：0x600000c4e3c0, 变量值：0x6000000109a0, 指向对象值：<MyObject: 0x6000000109a0>, --> weakObj-block
        HZLog(@"strongObj-block", strongObj); //0x7000058eed48, 变量值：0x6000000109a0, 指向对象值：<MyObject: 0x6000000109a0>, --> strongObj-block
        
        sleep(3);
        NSLog(@"sleep 3s -----------------");
        if (strongObj) {
            
            HZLog(@"weakObj-block", weakObj); //变量内存地址：0x600000c4e3c0, 变量值：0x6000000109a0, 指向对象值：<MyObject: 0x6000000109a0>, --> weakObj-block
            HZLog(@"strongObj-block", strongObj); //变量内存地址：0x7000058eed48, 变量值：0x6000000109a0, 指向对象值：<MyObject: 0x6000000109a0>, --> strongObj-block
        }
    });
    sleep(1);
    NSLog(@"sleep 1s -----------------");
    myObject = nil;
    sleep(5);
    NSLog(@"sleep 5s -----------------");
    HZLog(@"weakObj-2", weakObj); //变量内存地址：0x7ffee7686440, 变量值：0x0, 指向对象值：(null), --> weakObj-2
    /*
     从上述结果可以看出:
        只要block内部的代码开始执行,block内部就会通过__strong在执行期间进行强引用操作,保证block内部strongObj始终是可用的.因此我们可以在使用strongObj的时候使用
     if(strongObj){}进行使用,先判断strongObj是否已经被释放再执行后续代码
     */
}
- (void)test1{
    /*
     __weak
     */
    MyObject *myObject = [[MyObject alloc]init];
    myObject.txt = @"my_object";
    HZLog(@"obj", myObject); // 变量内存地址：0x7ffee1bc3448, 变量值：0x600002d08760, 指向对象值：<MyObject: 0x600002d08760>, --> obj
    
    __weak MyObject *weakObj = myObject;
    HZLog(@"weakObj", weakObj); // 变量内存地址：0x7ffee1bc3440, 变量值：0x600002d08760, 指向对象值：<MyObject: 0x600002d08760>, --> weakObj
    
    void(^testBlock)(void) = ^(){
        HZLog(@"weakObj - block", weakObj);
    };
    
    testBlock(); // 变量内存地址：0x6000021545c0, 变量值：0x600002d08760, 指向对象值：<MyObject: 0x600002d08760>, --> weakObj - block
    
    // 结果: block内部weakObj跟block外部的weakObj并不是同一变量,说明block在捕获weakobj的同时也对obj进行了弱引用,当在block外把obj释放了之后,block内部再也读不到这个变量了
    
    myObject = nil;
    
    testBlock(); // 变量内存地址：0x600000879820, 变量值：0x0, 指向对象值：(null), --> weakObj - block
    //当myObject=nil时,block内部的weakobj也为nil了,也就是说obj实际上是被释放了,可见__weak是可以避免循环引用问题的.
}


@end
