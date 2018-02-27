//
//  AAAViewController.m
//  OCTest
//
//  Created by xulianpeng on 2018/1/25.
//  Copyright © 2018年 lianpeng. All rights reserved.
//

#import "AAAViewController.h"

@interface AAAViewController ()
{
    UITextView *inputTextView;
}
@end

@implementation AAAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBottomBar];
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



@end
