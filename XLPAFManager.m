//
//  XLPAFManager.m
//  IPlayMTG
//
//  Created by lianpeng on 2017/3/23.
//  Copyright © 2017年 iplaymtg. All rights reserved.
//

#import "XLPAFManager.h"
#import "AFNetworking.h"
@implementation XLPAFManager


+ (XLPAFManager *)shared{
    static XLPAFManager *AFManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AFManager = [[XLPAFManager alloc] init];
    });
    return AFManager;
}
- (instancetype)init{
    if (self = [super init]) {
        
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.requestSerializer.timeoutInterval = netTimeoutInterval;
    }
    return self;
}

- (void)Get:(NSString *)urlStr para:(NSDictionary *)para succeed:(XLPAFSuccessBlock)succeedBlock{
    
    [self.manager GET:urlStr parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            succeedBlock(responseObject);
            
        } else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)POST:(NSString *)urlStr para1:(NSDictionary *)para  succeed:(XLPAFSuccessBlock)succeedBlock{
    

    [self.manager POST:urlStr parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            succeedBlock(responseObject);
        } else {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}
/*
 这个是最终的
 */
- (void)POST:(NSString *)urlStr para:(NSDictionary *)para succeed:(XLPAFSuccessBlock)succeedBlock{
    
    [self.manager POST:urlStr parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            succeedBlock(responseObject);
        } else {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}
@end