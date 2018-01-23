//
//  OneViewController.m
//  OCTest
//
//  Created by xulianpeng on 2018/1/5.
//  Copyright © 2018年 lianpeng. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

#define cutDownTime  60
@interface OneViewController ()
{
    UIButton *bt;
     UIButton *bt1;
    dispatch_source_t rootTimer;
}
@end

//封装思路
// 点击按钮的操作  比如发送验证码
// UI的自定义 点击前的颜色 显示字符 点击后的颜色 显示字符  倒计时结束后的 颜色和显示字符

//字符 简单的 s倒计时  还是HH:MM:SS

//如果一个页面上有多个定时器



@implementation OneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:bt];
    [bt setTitle:@"发送验证码" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(downHandle) forControlEvents:UIControlEventTouchUpInside];
    bt.backgroundColor = [UIColor cyanColor];
    
    
    
    bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    bt1.frame = CGRectMake(100, 300, 100, 40);
    [self.view addSubview:bt1];
    [bt1 setTitle:@"跳  转" forState:UIControlStateNormal];
    [bt1 addTarget:self action:@selector(pushHandle) forControlEvents:UIControlEventTouchUpInside];
    bt1.backgroundColor = [UIColor cyanColor];
    

    
    
   

}
- (void)downHandle{
    
    NSInteger time1 = round([[NSDate date]timeIntervalSince1970]);
    [[NSUserDefaults standardUserDefaults]setInteger:time1 forKey:@"timerKey"];  //setValue:time1 forKey:@"timerKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //制作定时器
    
    __block int timeout = cutDownTime; //设置时间间隔
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    rootTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(rootTimer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
//    [self initRootTimer];

    dispatch_source_set_event_handler(rootTimer, ^{    //在这里执行事件
        
    
        
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(rootTimer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时结束后的UI处理
                bt.userInteractionEnabled = YES;
                [bt setTitle:@"发送验证码" forState:UIControlStateNormal];
                bt.backgroundColor = [UIColor cyanColor];

                [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"timerkey"];
                [[NSUserDefaults standardUserDefaults]synchronize];

            });
        }else{
            NSLog(@"时间 = %d",timeout);
            NSString *strTime = [NSString stringWithFormat:@"(%dS)",timeout];
            NSLog(@"strTime = %@",strTime);
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时过程中的UI处理
                [bt setTitle:strTime forState:UIControlStateNormal];
                bt.userInteractionEnabled = NO;
                bt.backgroundColor = [UIColor grayColor];

            });

            timeout --;
        }
         
    });
    dispatch_resume(rootTimer);
}
- (void)pushHandle{
    TwoViewController *TWOVC = [TwoViewController new];
    [self.navigationController pushViewController:TWOVC animated:true];
}


- (void)beginTime{
    NSInteger time1 = [[NSUserDefaults standardUserDefaults]integerForKey:@"timerKey"]; //valueForKey:@"timerKey"];
    NSInteger time2 = round([[NSDate date] timeIntervalSince1970]);
    NSInteger mmmm = time2 - time1;
    
    NSLog(@"旧的时间 ==%ld\n 新的时间==%ld\n 时间差值==%ld",time1,time2,mmmm);
    if (mmmm > 0) {
        
        if (mmmm < cutDownTime ) {
            
            //则从 20 - mmmm 显示
            [self downHandleWithTimeout:(cutDownTime - mmmm)];
            
        }else{
            //则不显示
        }
    }
}
- (void)cancelTime{
    if (rootTimer) {
        
        dispatch_source_cancel(rootTimer);
    }

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self cancelTime];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self beginTime];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(beginTime) name:@"beginTime" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cancelTime) name:@"cancelTime" object:nil];
}

- (void)downHandleWithTimeout:(NSInteger)timeout1{
    
    //制作定时器
    
    
    __block NSInteger timeout = timeout1; //设置时间间隔
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    rootTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(rootTimer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行

    dispatch_source_set_event_handler(rootTimer, ^{    //在这里执行事件
        
        
        
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(rootTimer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时结束后的UI处理
                bt.userInteractionEnabled = YES;
                [bt setTitle:@"发送验证码" forState:UIControlStateNormal];
                bt.backgroundColor = [UIColor cyanColor];
                
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"timerkey"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
            });
        }else{
            NSLog(@"时间 = %d",timeout);
            NSString *strTime = [NSString stringWithFormat:@"(%dS)",timeout];
            NSLog(@"strTime = %@",strTime);
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时过程中的UI处理
                [bt setTitle:strTime forState:UIControlStateNormal];
                bt.userInteractionEnabled = NO;
                bt.backgroundColor = [UIColor grayColor];
                
            });
            
            timeout --;
        }
        
    });
    dispatch_resume(rootTimer);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
