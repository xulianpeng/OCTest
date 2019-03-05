//
//  EasyModel.h
//  OCTest
//
//  Created by xulianpeng on 2019/3/4.
//  Copyright © 2019 lianpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EasyModel : NSObject

@property (nonatomic, strong) NSNumber * id;
@property (nonatomic, strong) NSNumber * module;
@property (nonatomic, strong) NSNumber * replyNum;
@property (nonatomic, strong) NSString * subClass;
@property (nonatomic, strong) NSString * thumbnail;
@property (nonatomic, strong) NSNumber * timeStamp;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSNumber * topFlag;
@property (nonatomic, strong) NSString * author;
@property (nonatomic, strong) NSNumber * visitNum;
@property (nonatomic, strong) NSNumber * canRead;//是否可见
@property (nonatomic, strong) NSNumber * type;//类型：普通资讯1、专题2、推广4等

@end

NS_ASSUME_NONNULL_END
