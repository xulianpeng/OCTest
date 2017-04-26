//
//  ToolClass.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "XLPTool.h"
#import "MBProgressHud.h"
@implementation XLPTool
+ (NSString *)kGetLibraryPath{
    
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
}
+ (NSString *)kGetDocumentPath{
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
}

+ (NSString *) kCreateDocDirectoryWith:(NSString *)name{
    
    NSString *docPath = [self kGetDocumentPath];
    NSFileManager* fileManager = NSFileManager.defaultManager;
    NSString *finalPath = [docPath stringByAppendingPathComponent:name];
    
    if (![fileManager fileExistsAtPath:finalPath]) {
        
        [fileManager createDirectoryAtPath:finalPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    return finalPath;
}

+ (NSString *)kCreatFile:(NSString *)name{
    
    NSString *docPath = [self kGetDocumentPath];
    NSFileManager* fileManager = NSFileManager.defaultManager;
    NSString *finalPath = [docPath stringByAppendingPathComponent:name];
    
    if (![fileManager fileExistsAtPath:finalPath]) {
        
        BOOL success = [fileManager createFileAtPath:finalPath contents:nil attributes:nil];
        if (!success) {
            
            NSLog(@"=======创建文件%@失败",name);
        }
    }
    NSLog(@"路径为%@",finalPath);
    return finalPath;
}

+ (void)kUDefaultsSetId:(nullable id)value forkey:(nullable NSString *)key {
    
    [kUserDefaults setObject:value forKey:key];
    [kUserDefaults synchronize];
}
+ (void)kUDefaultsSetBool:(BOOL)value forkey:(nullable NSString *)key {
    
    [kUserDefaults setBool:value forKey:key];
    [kUserDefaults synchronize];
}
+ (nullable id)kUDefaultsValueForKey:(nullable NSString *)key{
    
    id value = [kUserDefaults objectForKey:key];
    return value;
}
+ (void)kUDefaultsRemoveObjectForKey:(nullable NSString *)key{
    
    [kUserDefaults removeObjectForKey:key];
    [kUserDefaults synchronize];
    
}

+(void)showHudwithMessage:(nullable NSString*)message andWhere:(nullable UIView *)view byDuration:(float)duration
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.8f];
    hud.label.textColor = [UIColor whiteColor];//改变字体颜色
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:duration];
}
@end
