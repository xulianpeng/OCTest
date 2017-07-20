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
@interface TestTwoViewController ()

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
