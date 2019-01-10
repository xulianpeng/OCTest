//
//  AAAViewController.m
//  OCTest
//
//  Created by xulianpeng on 2018/1/25.
//  Copyright © 2018年 lianpeng. All rights reserved.
//

#import "AAAViewController.h"
#import "TestLockObject.h"
@interface AAAViewController ()
{
    UITextView *inputTextView;
}
@end

@implementation AAAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBottomBar];
    [self testlock];
}
- (void)initBottomBar{
    inputTextView = [[UITextView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
    [self.view addSubview:inputTextView];
    inputTextView.backgroundColor = [UIColor yellowColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testlock{
    
    //1 若不加锁 则6条输出语句,交叉输出顺序不固定
    //2 若加同一把锁 则 method1/2 的3条语句 固定顺序输出 但是 A组 B组顺序不固定
    
    //疑惑 为什么1 中6条语句 交叉输出 而不是 A组 B组 顺序不固定
    TestLockObject *obj = [[TestLockObject alloc] init];
    NSLock *lock = [[NSLock alloc] init];

    //线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [lock lock];
        
        [obj method1];
        
//        sleep(20);
        
        [lock unlock];
        
    });
    //线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        [lock lock];
        
        [obj method2];
        
        [lock unlock];
        
    });
    
    
    
    
}






@end
