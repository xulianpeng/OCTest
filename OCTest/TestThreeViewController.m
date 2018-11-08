//
//  TestThreeViewController.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "TestThreeViewController.h"
#import "OneViewController.h"
#import <MeiQiaSDK/MeiqiaSDK.h>
#import <Meiqia/MQChatViewManager.h>
@interface TestThreeViewController ()
{
    UIButton *bt;
}
@end

@implementation TestThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:bt];
    [bt setTitle:@"跳  转" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pushHandle) forControlEvents:UIControlEventTouchUpInside];
    bt.backgroundColor = [UIColor cyanColor];
    
    
    
}
- (void)pushHandle{
//    OneViewController *oneVC = [OneViewController new];
//    [self.navigationController pushViewController:oneVC animated:true];
    
    MQChatViewManager *manager = [[MQChatViewManager alloc]init];
    [manager pushMQChatViewControllerInViewController:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
