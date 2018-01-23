//
//  RootTabBarController.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "RootTabBarController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"
#import "TestThreeViewController.h"
#import <MeiQiaSDK/MeiqiaSDK.h>
#import "MQChatViewManager.h"

@interface RootTabBarController ()

@end


@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestOneViewController *oneVC = [TestOneViewController new];
    TestTwoViewController *twoVC = [TestTwoViewController new];
    TestThreeViewController *threeVC = [TestThreeViewController new];
    XLPBaseNavigationVController *naVC1 = [self obtainVC:oneVC andTitle:@"首页" imageName:@"asda"];
    XLPBaseNavigationVController *naVC2 = [self obtainVC:twoVC andTitle:@"资讯" imageName:@"asda"];
    XLPBaseNavigationVController *naVC3 = [self obtainVC:threeVC andTitle:@"商城" imageName:@"asd"];
    self.viewControllers = [NSArray arrayWithObjects:naVC1,naVC2,naVC3, nil];
    
}
- (XLPBaseNavigationVController *)obtainVC:(XLPBaseVController *)vc andTitle:(NSString *)title imageName:(NSString *)name  {
    
    XLPBaseNavigationVController *navc = [[XLPBaseNavigationVController alloc]initWithRootViewController:vc];
    navc.tabBarItem.title = title;
    navc.tabBarItem.image = [UIImage imageNamed:name];
    return navc;
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
