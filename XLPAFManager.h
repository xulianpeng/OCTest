//
//  XLPAFManager.h
//  IPlayMTG
//
//  Created by lianpeng on 2017/3/23.
//  Copyright © 2017年 ;. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface XLPAFManager : NSObject
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,assign)NSTimeInterval xlpTimeoutInterval;
+ (XLPAFManager *)shared;
- (void)Get:(NSString *)urlStr para:(NSDictionary *)para finished:(XLPAFDoneBlock)finishBlock;
- (void)POST:(NSString *)urlStr para:(NSDictionary *)para finished:(XLPAFDoneBlock)finishBlock;
- (void)Get:(NSString *)urlStr para:(NSDictionary *)para succeed:(XLPAFSuccessBlock)succeedBlock;
- (void)POST:(NSString *)urlStr para:(NSDictionary *)para succeed:(XLPAFSuccessBlock)succeedBlock;

@end
