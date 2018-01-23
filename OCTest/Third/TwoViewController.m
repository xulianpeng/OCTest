//
//  TwoViewController.m
//  OCTest
//
//  Created by xulianpeng on 2018/1/5.
//  Copyright © 2018年 lianpeng. All rights reserved.
//

#import "TwoViewController.h"
#import "XlpCountDownView.h"
@interface TwoViewController ()<XlpCountDownViewDelegate>
{
    UIButton *bt;
    XlpCountDownView *timerView;
}
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:bt];
    [bt setTitle:@"跳  转" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pushHandle) forControlEvents:UIControlEventTouchUpInside];
    bt.backgroundColor = [UIColor cyanColor];
    
    
    timerView = [[XlpCountDownView alloc]initWithFrame:CGRectMake(100, 300, 100, 40) type:CountDownTypeS];
    
    timerView.beforeBackColor = [UIColor magentaColor];
    timerView.afterBackColor = [UIColor grayColor];
    
    timerView.TheCountDownTime = 60;
    timerView.delegate = self;
    [self.view addSubview:timerView];
}
- (void)countDownHandle{
    
    self.view.backgroundColor = [UIColor redColor];
}
- (void)countDownEndHandle{
    self.view.backgroundColor = [UIColor yellowColor];
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
