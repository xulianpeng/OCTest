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
#import "AFNetworking.h"

#import "TwoGroup/TwoTableController.h"
@interface TestTwoViewController ()
{
    UIButton *bt;
}
@end

@implementation TestTwoViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[XLPAFManager shared] cancelOperationWithUrl:@"www.baidu.com"];
}
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
    /*
    NSString *requestUrl = @"https://eco-api.meiqia.com/atu/launch";
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    NSDictionary *body = [NSDictionary dictionaryWithObject:@"AX4EAAUOEVt4AEFRQUNRcXdlSUFnQkFBQUFRd0xPRDZWcUtCWHlmZ0lBQVFBQ1Fxd2VBaGNCQUFBQXpGOWtENlZxS0JXOUpnQUHlh_FS2Xoa14z6Z77vEurV58U7eMnsYALrRJtoUDrs1klwhxjxpsRFBhIXrGAoAQaFsStSPmPqQH1rWuoqeenf" forKey:@"access_token"];
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];
    [request setHTTPBody: bodyData];
//    [request setValue:[NSString stringWithFormat:@"%lu",bodyData.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    request.timeoutInterval= 10;
    
  
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
//    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//                                                 @"text/html",
//                                                 @"text/json",
//                                                 @"text/javascript",
//                                                 @"text/plain",
//                                                 nil];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){
        if(responseObject!=nil){

            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONWritingPrettyPrinted error:nil ];

            NSLog(@"%@",responseObject);
        }
    }]resume];
    */
    
    TwoTableController *oneVC = [TwoTableController new];
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
