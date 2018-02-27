//
//  TestTwoViewController.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "TestTwoViewController.h"
#import "NSString+XLPStringMaker.h"
#import "Person_CallMyName.h"

#import "AAAViewController.h"
@interface TestTwoViewController ()
{
    UIButton *bt;
}
@end

@implementation TestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[XLPAFManager shared]Get:@"www.baidu.com" para:nil succeed:^(id responseObject) {
       
        NSLog(@"lalalla");
    }];
    
    NSString *testStr = @"我是大帅哥啦啦啦";
    NSLog(@"朗格里朗===%ld",(long)[testStr obtainLength]);
    
    [Person callMyName];
    Person *thePerson = [[Person alloc]init];
    [thePerson callMyFirstName];
    [thePerson callMySecondName];
    
    
    bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:bt];
    [bt setTitle:@"跳  转" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pushHandle) forControlEvents:UIControlEventTouchUpInside];
    bt.backgroundColor = [UIColor cyanColor];
    
}
- (void)pushHandle{
    AAAViewController *oneVC = [AAAViewController new];
    oneVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:oneVC animated:true];
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
