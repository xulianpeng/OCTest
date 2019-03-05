
//
//  TwoTableController.m
//  OCTest
//
//  Created by xulianpeng on 2019/3/4.
//  Copyright © 2019 lianpeng. All rights reserved.
//

#import "TwoTableController.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "EasyModel.h"
#import "EasyCell.h"
#import "XlpRefreshHeaderView.h"
@interface TwoTableController ()<UITableViewDelegate,UITableViewDataSource,XlpRefreshHeaderViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *rootArr;
    UITableView *rootTableView;
    XlpRefreshHeaderView * refreshHeader;
}


@end

@implementation TwoTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    rootArr = [NSMutableArray new];
    rootTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [rootTableView registerClass:[EasyCell class] forCellReuseIdentifier:@"EasyCell"];
    rootTableView.delegate = self;
    rootTableView.dataSource = self;
    [self.view addSubview:rootTableView];
    
    
    
//    refreshHeader = [[XlpRefreshHeaderView alloc]initWithFrame:CGRectMake(0, -200, self.view.frame.size.width, 200)];
    refreshHeader = [[XlpRefreshHeaderView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height, self.view.frame.size.width, 200)];

    refreshHeader.delegate = self;
    
    [rootTableView addSubview:refreshHeader];
    [self obtainDataWithWMNet2];
    
}

- (void)obtainDataWithWMNet2{
   
    NSString * url = @"http://www.iyingdi.com/article/list";
    NSDictionary *dic= @{@"module":@11,@"size":@20,@"system":@"ios",@"timestamp":@0,@"version":@410};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    

    [manager GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        BOOL isSucceed = [responseObject objectForKey:@"success"];
        if (isSucceed) {
         
            NSArray * arr = [responseObject objectForKey:@"articles"];
            
            for (int i = 0; i < arr.count; i ++) {
                
                NSArray *arro = arr[i];
                EasyModel *model = [EasyModel new];
                model.id = [NSNumber numberWithInteger:11];
                model.replyNum = arro[4];
                model.subClass = arro[17];
                model.thumbnail = arro[7];
                model.timeStamp = arro[2];
                model.title = arro[1];
                model.topFlag = arro[9];
                model.author = arro[14];
                model.visitNum = arro[5];
                model.canRead = arro[10];
                model.type = arro[11];
               
                [self->rootArr addObject:model];
                
                
                
            }
            [self->rootTableView reloadData];
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return rootArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EasyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EasyCell"];
    EasyModel *model = rootArr[indexPath.row];
    cell.model = model;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [refreshHeader xlpRefreshScrollViewDidScroll:scrollView];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [refreshHeader xlpRefreshScrollViewDidEndDragging:scrollView];
}

- (void)headerLoadMoreData{
    
    NSLog(@"下拉刷新更多数据=====");
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [refreshHeader xlpEndRefresh];
        NSLog(@"下拉刷新更多数据=====结束刷新");
    });

    
}

- (void)footerLoadMoreData{
    NSLog(@"上拉加载更多数据");
}


@end
