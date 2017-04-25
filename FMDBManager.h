//
//  FMDBManager.h
//  IPlayMTG
//
//  Created by lianpeng on 2017/3/22.
//  Copyright © 2017年  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface FMDBManager : NSObject
@property(nonatomic,strong)FMDatabase *dataBase;

+ (FMDBManager *)shared;
- (void)creatTable:(NSString *)table SqlStr:(NSString *)sqlStr;
- (BOOL)insertTable:(NSString *)table sql:(NSString *)sql dic:(NSDictionary*)dic orValuesArr:(NSArray *)theValuesArr;
- (id)queryTable:(NSString *)table sql:(NSString *)sql limitArr:(NSArray *)limitArr;
- (BOOL)deleteTable:(NSString *)table aql:(NSString *)sql limitArr:(NSArray *)limitArr;
- (BOOL)updateTable:(NSString *)table sql:(NSString *)sql limitArr:(NSArray *)limitArr;
- (BOOL)dropTable:(NSString *)table;
@end
