//
//  TestOneViewController.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "TestOneViewController.h"

@interface TestOneViewController ()

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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
