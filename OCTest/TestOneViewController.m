//
//  TestOneViewController.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "TestOneViewController.h"

@interface TestOneViewController ()
@property(nonatomic,weak)NSTimer *timer;
@end

@implementation TestOneViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    UITextField *textfield = [UITextField xlp_textFieldWithPlaceholder:@"默认主window上的textfield" color:[UIColor redColor] font:14 superView:self.view constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(70);
        make.size.mas_equalTo(CGSizeMake(100, 30));

    }];
    
    UIButton * testButton =  [UIButton xlp_buttonWithTitle:@"window测试" superView:self.view constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    } touchDown:^(UIButton *sender) {
        
        
        
        UIWindow *twoWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight)];
        
        twoWindow.windowLevel = 200;
//        [twoWindow becomeKeyWindow];
//        [twoWindow makeKeyWindow];
        twoWindow.hidden = NO;
        [[UIApplication sharedApplication].delegate.window addSubview:twoWindow];
        UILabel *label = [UILabel xlp_labelWithText:@"我擦什么鬼啊" superView:twoWindow constraints:^(MASConstraintMaker *make) {
            make.top.and.left.mas_equalTo(200);
            make.size.mas_equalTo(CGSizeMake(100, 40));
        }];
        label.backgroundColor = [UIColor greenColor];
        
        NSLog(@"点击按钮了啊");
        
    }];
    
    testButton.backgroundColor = [XLPTool colorWith16RGB:0x309D9A];
    
 
    
    NSLog(@" ====啦啦啦啦 网址是否有效呢===%d",[XLPTool kIsUrl:@"https:// "]);
    
#pragma mark - 面试题1
    /*************************面试题开始*************************************/

    //面试题  label  上下切换 切换间隔是 2s
//    CGSize size = CGSizeMake(200, 40);

    UIView *labelView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
    [self.view addSubview:labelView];
    labelView.backgroundColor = [UIColor cyanColor];
    
//    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, labelView.frame.size.width, labelView.frame.size.height)];
//    [self.view addSubview:firstLabel];
//    firstLabel.text = @"我说123木头人我爱你";
//    
//    UILabel * twoLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 340, 200, 40)];
//    [self.view addSubview:twoLabel];
//    twoLabel.text = @"你说你爱了不该爱的人";
//    twoLabel.alpha = 0.0;
    
    
    UILabel *firstLabel = [UILabel xlp_labelWithText:[XLPTool randomCreatChinese:5] superView:self.view constraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(labelView.mas_centerX);
        make.top.mas_equalTo(labelView.mas_top);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
    }];
    
    UILabel *twoLabel = [UILabel xlp_labelWithText:@"你爱我我爱你啦啦啦啦啦我爱你" superView:self.view constraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labelView.mas_bottom);
        make.centerX.mas_equalTo(labelView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
    }];
    twoLabel.alpha = 0.0;
    
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:firstLabel];
    [arr addObject:twoLabel];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        UILabel *label1 = arr[0];
        UILabel *label2 = arr[1];
        [arr exchangeObjectAtIndex:0 withObjectAtIndex:1];
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [label1 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(labelView.mas_top).offset(-40);
            }];
            [self.view layoutIfNeeded];
            label1.alpha = 0.0;
        } completion:^(BOOL finished) {
            
            //这样写不是想要的结果
//            [label1 mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(labelView.mas_bottom);
//            }];
            
            [label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(labelView.mas_bottom);
                make.centerX.mas_equalTo(labelView.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(200, 40));
            }];
            [self.view layoutIfNeeded];

        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            label2.alpha = 1.0;
            label2.backgroundColor = [XLPTool colorRandom];
            [label2 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(labelView.mas_top);
            }];
            [self.view layoutIfNeeded];
        }];
        
        //第二种方法
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            label2.frame = CGRectMake(100, 300, 200, 40);
//            label2.alpha = 1.0;
//            
//        }];
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            label1.frame = CGRectMake(100, 260, 200, 40);
//            label1.alpha = 0.0;
//        } completion:^(BOOL finished) {
//            label1.frame = CGRectMake(100, 340, 200, 40);
//
//        }];
    }];
    /*************************面试题结束*************************************/
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
