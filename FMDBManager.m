//
//  FMDBManager.m
//  IPlayMTG
//
//  Created by lianpeng on 2017/3/22.
//  Copyright © 2017年 iplaymtg. All rights reserved.
//

#import "FMDBManager.h"
#import "XLPTool.h"
#import "FMDB.h"
@implementation FMDBManager


+ (FMDBManager *)shared{
    static FMDBManager *DBManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DBManager = [[FMDBManager alloc] init];
    });
    return DBManager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        NSString *dataBasePath = [XLPTool kCreatFile:@"YingDi.sqlite"];
        self.dataBase = [FMDatabase databaseWithPath:dataBasePath];
        
    }
    return self;
}

/**
 创建表

 @param table <#table description#>
 @param sqlStr <#sqlStr description#>
 */
- (void)creatTable:(NSString *)table SqlStr:(NSString *)sqlStr{
    
    if (![self.dataBase open]) {
        
//        let hud = xlpHud.init(text: "亲,数据库未打开,初始化失败", constransY: 300)
//        hud.show()
//        hud.hideWhenAfter(time: 2)
        
        NSLog(@"======Unable to open database========");
        
    }else{
        
        NSLog(@"=============== open database=================");
        
        if ([self.dataBase  tableExists:table]) {
            
            NSLog(@"*********表已存在*******************");
            
        }else{
            
            NSString *sql = [NSString stringWithFormat:@"create table %@ (%@)",table,sqlStr];
            
            if ([self.dataBase executeUpdate:sql]) {
                NSLog(@"****创建表成功***************");
            }else{
                NSLog(@"****创建表成功***************,错误信息%@",[self.dataBase lastError]);
            }
            [self.dataBase close];
        }
    }
}

/**
 插入数据

 @param table <#table description#>
 @param sql <#sql description#>
 @param dic <#dic description#>
 @param theValuesArr <#theValuesArr description#>
 @return <#return value description#>
 */
- (BOOL)insertTable:(NSString *)table sql:(NSString *)sql dic:(NSDictionary*)dic orValuesArr:(NSArray *)theValuesArr{
    
    BOOL succeed = NO;
    
    if ([self.dataBase open]) {
        
        if (dic != nil) {
            
            NSMutableArray *valueArr = [NSMutableArray new];
            NSMutableArray *arr = [NSMutableArray new];
            NSArray *keyArr = [sql componentsSeparatedByString:@","];
            if (keyArr.count > 0) {
                
                for (NSString *key in keyArr) {
                    
                    [valueArr addObject:[dic valueForKey:key]];
                    [arr addObject:@"?"];
                }
                NSLog(@"%@===%@===%@",keyArr,valueArr,arr);
                NSString *arrStr = [arr componentsJoinedByString:@","];
                
                NSString *sqlStr  = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",table,sql,arrStr];
                
                succeed = [self.dataBase executeUpdate:sqlStr withArgumentsInArray:valueArr];
                if (succeed) {
                    NSLog(@"****插入数据成功***************");
                    
                }else{
                    NSLog(@"****插入数据失败***************,错误信息%@",[self.dataBase lastError]);
                    
                }
                
                
            }

        }else{
            
            if (theValuesArr != nil) {
                
                
                NSMutableArray *arr = [NSMutableArray new];
                NSArray *keyArr = [sql componentsSeparatedByString:@","];
                if (keyArr.count > 0) {
                    
                    for (NSString *key in keyArr) {
                        
                        [arr addObject:@"?"];
                    }
                    NSString *arrStr = [arr componentsJoinedByString:@","];
                    
                    NSString *sqlStr  = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",table,sql,arrStr];
                    
                    succeed = [self.dataBase executeUpdate:sqlStr withArgumentsInArray:theValuesArr];
                    if (succeed) {
                        NSLog(@"****插入数据成功***************");
                        
                    }else{
                        NSLog(@"****插入数据失败***************,错误信息%@",[self.dataBase lastError]);
                        
                    }
                    
                    
                }
            }
            
            
        }
    [self.dataBase close];
    }
    return succeed;
}

/**
 查询结果

 @param table <#table description#>
 @param sql <#sql description#>
 @param limitArr <#limitArr description#>
 @return <#return value description#>
 */
- (FMResultSet *)queryTable:(NSString *)table sql:(NSString *)sql limitArr:(NSArray *)limitArr{
    FMResultSet *resultSet;
    if ([self.dataBase open]) {
        
        resultSet = [self.dataBase executeQuery:sql withArgumentsInArray:limitArr];
       // [self.dataBase close];
    }
    return resultSet;
}

/**
 删除表中 某字段下的存储的值

 @param table <#table description#>
 @param sql <#sql description#>
 @param limitArr <#limitArr description#>
 @return <#return value description#>
 */
- (BOOL)deleteTable:(NSString *)table aql:(NSString *)sql limitArr:(NSArray *)limitArr{
    BOOL succeed = NO;
    if ([self.dataBase open]) {
        
        succeed = [self.dataBase executeUpdate:sql withArgumentsInArray:limitArr];
        
        if (!succeed) {
            NSLog(@"======删除数据失败%@",self.dataBase.lastErrorMessage);
        }
        [self.dataBase close];

    }
    return succeed;
}

/**
 更新表

 @param table <#table description#>
 @param sql <#sql description#>
 @param limitArr <#limitArr description#>
 @return <#return value description#>
 */
- (BOOL)updateTable:(NSString *)table sql:(NSString *)sql limitArr:(NSArray *)limitArr{
    
    BOOL succeed = NO;
    if ([self.dataBase open]) {
        
        succeed = [self.dataBase executeUpdate:sql withArgumentsInArray:limitArr];
        
        if (!succeed) {
            NSLog(@"======更新数据失败%@",self.dataBase.lastErrorMessage);
        }
        [self.dataBase close];
    }
    return succeed;
    
}

/**
 废弃表

 @param table <#table description#>
 @return <#return value description#>
 */
- (BOOL)dropTable:(NSString *)table{
    
    BOOL succeed = NO;
    if ([self.dataBase open]) {
        
        NSString *dropSql = [NSString stringWithFormat:@"drop table %@",table];
        succeed = [self.dataBase executeUpdate:dropSql withArgumentsInArray:nil];
        
        if (!succeed) {
            NSLog(@"======删除表失败==%@",self.dataBase.lastErrorMessage);
        }
        [self.dataBase close];
    }
    return succeed;
}
- (BOOL)addColumn:(NSString *)column type:(NSString *)type InTable:(NSString *)table{
    BOOL succeed = NO;
    if ([self.dataBase open]) {
        
        if (![self.dataBase columnExists:column inTableWithName:table]) {
            
            NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ %@",table,column,type];
            succeed = [self.dataBase executeUpdate:sql withArgumentsInArray:nil];
            
            if (!succeed) {
                NSLog(@"======添加字段失败==%@",self.dataBase.lastErrorMessage);
            }
            [self.dataBase close];
            
        }
        
    }
    return succeed;
}

/**
 删除表中已有的字段

 @param column <#column description#>
 @param table <#table description#>
 @return <#return value description#>
 */
- (BOOL)deleteColumn:(NSString *)column FromTable:(NSString *)table{
    BOOL succeed = NO;
    if ([self.dataBase open]) {
        
        if ([self.dataBase columnExists:column inTableWithName:table]) {
            
            NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ DROP COLUMN %@",table,column];
            succeed = [self.dataBase executeUpdate:sql withArgumentsInArray:nil];
            
            if (!succeed) {
                NSLog(@"======删除字段失败==%@",self.dataBase.lastErrorMessage);
            }
            [self.dataBase close];
            
        }else{
            NSLog(@"======该字段不存在==");
        }
    }
    return succeed;
}

/**
 修改已有字段的数据类型

 @param column 将要被修改的字段
 @param type 将要被修改成的数据类型
 @param table 表名
 @return <#return value description#>
 */
- (BOOL)changeColumnType:(NSString *)column type:(NSString *)type InTable:(NSString *)table{
    BOOL succeed = NO;
    if ([self.dataBase open]) {
        
        if ([self.dataBase columnExists:column inTableWithName:table]) {
            
            NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ALTER COLUMN %@ %@",table,column,type];
            succeed = [self.dataBase executeUpdate:sql withArgumentsInArray:nil];
            
            if (!succeed) {
                NSLog(@"======修改字段的数据类型失败==%@",self.dataBase.lastErrorMessage);
            }
            [self.dataBase close];
            
        }else{
            NSLog(@"======该字段不存在==");
        }
        
    }
    return succeed;
}
@end
