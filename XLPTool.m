//
//  ToolClass.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "XLPTool.h"
#import "sys/utsname.h"
#import "MBProgressHud.h"
@implementation XLPTool

+ (UIWindow *)kGetKeyWindow{
    
    return [UIApplication sharedApplication].keyWindow;
}
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

+ (UIColor *)colorWith16RGB:(int)rgbValue{
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0];
}
+ (nullable UIColor *)colorRandom{
    
    return [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
}
+ (BOOL)kIsPhoneNumber:(nullable NSString *)numStr {
    NSString * phoneNumber = @"^1[34578][0-9]{9}$";
    NSPredicate *regextestpn = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumber];
    if ([regextestpn evaluateWithObject:numStr] == YES) {
        return YES;
    }else {
        return NO;
    }
}
+ (BOOL)kIsUrl:(nullable NSString *)urlStr{
    
    NSString * phoneNumber = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    NSPredicate *regextestpn = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumber];
    if ([regextestpn evaluateWithObject:urlStr] == YES) {
        return YES;
    }else {
        return NO;
    }
}
//随机生成指定个数的汉字
+ (NSMutableString*)randomCreatChinese:(NSInteger)count{
    
    NSMutableString *randomChineseString =@"".mutableCopy;
    
    for(NSInteger i =0; i < count; i++){
        
//        NSStringEncodinggbk Encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
        //随机生成汉字高位
        
        NSInteger randomH =0xA1+arc4random()%(0xFE - 0xA1+1);
        
        //随机生成汉子低位
        
        NSInteger randomL =0xB0+arc4random()%(0xF7 - 0xB0+1);
        
        //组合生成随机汉字
        
        NSInteger number = (randomH << 8)+randomL;
        
        NSData*data = [NSData dataWithBytes:&number length:2];
        
        NSString*string = [[NSString alloc]initWithData:data encoding:enc];
        
        [randomChineseString appendString:string];
        
    }
    
    return randomChineseString;
    
}

+ (NSString*)kObtainDeviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"VerizoniPhone4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone6Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone6sPlus";
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone7";
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone7Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone8";
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone8Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"])    return @"iPhoneX";
    
    return deviceString;
}

@end
