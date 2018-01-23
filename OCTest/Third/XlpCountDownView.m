//
//  XlpCountDownView.m
//  OCTest
//
//  Created by xulianpeng on 2018/1/5.
//  Copyright © 2018年 lianpeng. All rights reserved.
//

#import "XlpCountDownView.h"

@implementation XlpCountDownView
{
    UIButton *bt;
    dispatch_source_t _timer;

}

//- (void)setRootTimer:(dispatch_source_t)rootTimer{
//    if (!rootTimer) {
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        rootTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//        dispatch_source_set_timer(rootTimer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
//    }
//}

- (instancetype)initWithFrame:(CGRect)frame type:(CountDownType *)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:bt];
        
//        [bt setTitle:self.beforeStr forState:UIControlStateNormal];
//        [bt.titleLabel setFont:self.beforefont];
//        [bt setTitleColor:self.beforeColor forState:UIControlStateNormal];
        
        [bt setTitle:@"获取验证码" forState:UIControlStateNormal];
        [bt.titleLabel setFont:self.beforefont];
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [bt addTarget:self action:@selector(downHandle) forControlEvents:UIControlEventTouchUpInside];
        bt.backgroundColor = self.beforeBackColor;
//        bt.backgroundColor = [UIColor magentaColor];
        
    }
    return self;
}

- (void)downHandle{
    
    NSInteger time1 = round([[NSDate date]timeIntervalSince1970]);
    [[NSUserDefaults standardUserDefaults]setInteger:time1 forKey:@"timerKey"];  //setValue:time1 forKey:@"timerKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //制作定时器
    
    __block NSInteger timeout = self.TheCountDownTime; //设置时间间隔
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{    //在这里执行事件

        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时结束后的UI处理
                
                bt.userInteractionEnabled = YES;
                
                [bt setTitle:self.beforeStr forState:UIControlStateNormal];
                [bt.titleLabel setFont:self.beforefont];
                [bt setTitleColor:self.beforeColor forState:UIControlStateNormal];
                
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"timerkey"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                if([self.delegate respondsToSelector:@selector(countDownEndHandle)]){
                    [self.delegate countDownEndHandle];
                }
                
            });
        }else{
            NSLog(@"时间 = %ld",timeout);
            NSString *strTime = [NSString stringWithFormat:@"(%ldS)",timeout];
            NSLog(@"strTime = %@",strTime);
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时过程中的UI处理
                bt.userInteractionEnabled = NO;
                
                [bt setTitle:strTime forState:UIControlStateNormal];
                [bt.titleLabel setFont:self.afterFont];
                [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//self.afterColor forState:UIControlStateNormal];
                
                bt.backgroundColor = self.afterBackColor;
                if([self.delegate respondsToSelector:@selector(countDownHandle)]){
                    [self.delegate countDownHandle];
                }

            });
            
            timeout --;
        }
        
    });
    dispatch_resume(_timer);
}


- (void)beginTime{
    
    NSInteger time1 = [[NSUserDefaults standardUserDefaults]integerForKey:@"timerKey"]; //valueForKey:@"timerKey"];
    NSInteger time2 = round([[NSDate date] timeIntervalSince1970]);
    NSInteger mmmm = time2 - time1;
    
    NSLog(@"旧的时间 ==%ld\n 新的时间==%ld\n 时间差值==%ld",time1,time2,mmmm);
    if (mmmm > 0) {
        
        if (mmmm < self.TheCountDownTime ) {
            
            //则从 20 - mmmm 显示
            [self downHandleWithTimeout:(self.TheCountDownTime - mmmm)];
            
        }else{
            //则不显示
        }
    }
}

- (void)cancelTime{
    dispatch_source_cancel(_timer);

}

- (void)downHandleWithTimeout:(NSInteger)timeout1{
    
    //制作定时器
    __block NSInteger timeout = timeout1; //设置时间间隔
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{    //在这里执行事件
        
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时结束后的UI处理
                bt.userInteractionEnabled = YES;
                
                [bt setTitle:self.beforeStr forState:UIControlStateNormal];
                [bt.titleLabel setFont:self.beforefont];
                [bt setTitleColor:self.beforeColor forState:UIControlStateNormal];
                
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"timerkey"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
            });
        }else{
            NSString *strTime = [NSString stringWithFormat:@"(%ldS)",timeout];
            NSLog(@"strTime = %@",strTime);
            dispatch_async(dispatch_get_main_queue(), ^{
                //定时过程中的UI处理
                bt.userInteractionEnabled = NO;
                
                [bt setTitle:self.afterStr forState:UIControlStateNormal];
                [bt.titleLabel setFont:self.afterFont];
                [bt setTitleColor:self.afterColor forState:UIControlStateNormal];
                
                bt.backgroundColor = self.afterBackColor;
            });
            
            timeout --;
        }
        
    });
    dispatch_resume(_timer);
}

- (void)setBeforeBackColor:(UIColor *)beforeBackColor{
    
    if (!beforeBackColor) {
        
        beforeBackColor = [UIColor greenColor];
    }
    
}

- (void)setAfterBackColor:(UIColor *)afterBackColor{
    if (!afterBackColor) {
        
        afterBackColor = [UIColor grayColor];
    }
}
- (void)setEndBackColor:(UIColor *)endBackColor{
    if (!endBackColor) {
        
        if (self.beforeBackColor) {
            
            endBackColor = self.beforeBackColor;
        }else{
            
            endBackColor = [UIColor blueColor];
        }
    }
}

- (void)setBeforeStr:(NSString *)beforeStr{
    
    if (!beforeStr) {
        beforeStr = @"获取验证码";
    }
    
}
- (void)setBeforefont:(UIFont *)beforefont{
    if(!beforefont){
        beforefont = [UIFont systemFontOfSize:14];
    }
    
}
- (void)setBeforeColor:(UIColor *)beforeColor{
    if (!beforeColor) {
        beforeColor = [UIColor blackColor];
    }
}


- (void)setAfterStr:(NSString *)afterStr{
    if (!afterStr) {
        
        
        afterStr = @"";
    }
    
}
- (void)setAfterFont:(UIFont *)afterFont{
    if(!afterFont){
        afterFont = [UIFont systemFontOfSize:14];
    }
}
- (void)setAfterColor:(UIColor *)afterColor{
    if (!afterColor) {
        afterColor = [UIColor blackColor];
    }
}


- (void)setEndStr:(NSString *)endStr{
    if (!endStr) {
        if (_beforeStr) {
            endStr = _beforeStr;
        }else{
            
            endStr = @"获取验证码";
        }
    }
}
- (void)setEndFont:(UIFont *)endFont{
    if(!endFont){
        if (_beforefont) {
            endFont = _beforefont;
        }else{
            
            endFont = [UIFont systemFontOfSize:14];
        }
    }
}
- (void)setEndColor:(UIColor *)endColor{
    if (!endColor) {
        if (_beforeColor) {
            endColor = _beforeColor;
        } else {
            endColor = [UIColor blackColor];
        }
        endColor = [UIColor blackColor];
    }
}
@end
