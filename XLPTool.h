//
//  ToolClass.h
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLPTool : NSObject
+ (nullable NSString *)kGetLibraryPath;
+ (nullable NSString *)kGetDocumentPath;
+ (nullable NSString *)kCreatFile:(nullable NSString *)name;
+ (nullable NSString *)kCreateDocDirectoryWith:(nullable NSString *)name;
+ (void)kUDefaultsSetId:(nullable id)value forkey:(nullable NSString *)key;
+ (void)kUDefaultsSetBool:(BOOL)value forkey:(nullable NSString *)key;
+ (nullable id)kUDefaultsValueForKey:(nullable NSString *)key;
+ (void)kUDefaultsRemoveObjectForKey:(nullable NSString *)key;
@end