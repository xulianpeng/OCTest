
//
//  XLPDefine.h
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#ifndef XLPDefine_h
#define XLPDefine_h

//开始添加
#import <UIKit/UIKit.h>
#import "Masonry.h"
//数据库中的表名

#define kTable_StoreArticle @"storeArticleTable"
#define kTable_ReadTable @"readTable"
#define kTable_ShareTable @"shareTable"
#define kTable_CommentTaskTable @"commentTaskTable"
#define kTable_SupportTaskTable @"supportTaskTable"
#define kTable_LoginTaskTable @"loginTaskTable"
#define kTable_NotificeTable @"notificeTable"
#define kTable_TaskTable @"TaskTable"
#define kTable_NewsCacheTable @"newsCacheTable"
#define kTable_LevelsTable @"levelsTable"
#define kTable_ModuleTable @"moduleTable"

//网络请求超时时间
#define netTimeoutInterval 15.0f




/**
 * 用于添加约束
 *
 * @param make 与Masonry的make一致
 */
typedef void(^XLPConstraintMaker)(MASConstraintMaker *make);

typedef void (^XLPAFDoneBlock)(NSDictionary *responseObject, NSError *errorMsg);
typedef void (^XLPAFSuccessBlock)(id responseObject);
typedef void (^XLPErrorBlock)(NSError *error);
typedef void (^XLPErrorMessageBlock)(NSString *errorMsg);
typedef void (^XLPVoidBlock)(void);

typedef void (^XLPNotificationBlock)(NSNotification *notification);

typedef void (^XLPBoolBlock)(BOOL result);
typedef void (^XLPBoolMsgBlock)(BOOL result, NSString *errorMsg);

typedef void (^XLPArrayBlock)(NSArray *resultList);
typedef void (^XLPArrayMsgBlock)(NSArray *resultList, NSString *errorMsg);

typedef void (^XLPDictionaryBlock)(NSDictionary *resultDict);
typedef void (^XLPDictionaryMsgBlock)(NSDictionary *resultDict, NSString *errorMsg);

typedef void (^XLPNumberBlock)(NSNumber *resultNumber);
typedef void (^XLPNumberMsgBlock)(NSNumber *resultNumber, NSString *errorMsg);

typedef void (^XLPIntegerBlock)(NSInteger resultNumber);
typedef void (^XLPIntegerMsgBlock)(NSInteger resultNumber, NSString *errorMsg);

typedef void (^XLPStringBlock)(NSString *result);
typedef void (^XLPStringMsgBlock)(NSString *result, NSString *errorMsg);

typedef void (^XLPIdBlock)(id sender);
typedef void (^XLPIdMsgBlock)(id result, NSString *errorMsg);
//
// 按钮点击事件相应的回调block
//
typedef void(^XLPButtonBlock)(UIButton *sender);
typedef void(^XLPButtonIndexBlock)(NSUInteger index, UIButton *sender);

//
// 手势相关回调block
typedef void(^XLPGestureBlock)(UIGestureRecognizer *sender);

typedef void(^XLPSwitchValueChangedBlock)(UISwitch *sender);
typedef void(^XLPValueChangedBlock)(id sender);

#define KNumberWithInteger(integer) [NSNumber numberWithInteger:integer]
#define KNumberWithInt(int) [NSNumber numberWithInteger:int]

#define kDefaultsSetValue(value,key)  [XLPTool kUDefaultsSetId:value forkey:key];
#define kDefaultsSetBool(bool,key)  [XLPTool kUDefaultsSetBool:bool forkey:key];
#define kDefaultsRemove(key)  [XLPTool kUDefaultsRemoveObjectForKey:key];


// string format
#define kStringFormat(format, params) ([NSString stringWithFormat:(format), (params)])

// weak / strong object
#define kWeakObject(object) __weak __typeof(object) weakObject = object;
#define kWeak(caller, object) __weak __typeof(object) caller = object;

#define kStrongObject(object) __strong __typedef(object) strongObject = object;

// main thread / global thread
#define kMainThread (dispatch_get_main_queue())
#define kGlobalThread dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

// 延迟执行  second = 秒/ block = ^(){}
#define kDispathAfter(second,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(),block);

// ios version
#define kIOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])

// lanscape
#define kIsLandscape (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

// ipad
#define kIsIPad \
([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]\
&& [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

// radians to degrees
#define kRadiansToDegrees(radians) ((radians) * (180.0 / M_PI))
// Degrees to radians
#define kDegreesToRadians(angle) ((angle) / 180.0 * M_PI)

// IOS system version
#define kIsIOS6OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 6 ? YES : NO)
#define kIsIOS7OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 7 ? YES : NO)
#define kIsIOS7Litter ([UIDevice currentDevice].systemVersion.integerValue < 7 ? YES : NO)
#define kIsIOS8OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 8 ? YES : NO)
#define kIsIOS9OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 9 ? YES : NO)
#define kIsIOS10OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 10 ? YES : NO)

// Screen width and height
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

// device
#define kIs5OrLater ([[UIScreen mainScreen] currentMode].size.height >= 960)
#define kScreenBounds ([UIScreen mainScreen].bounds)
#define kIs6Plus (kScreenHeight >= 667)
#define kIs6 (kScreenHeight > 568 && kScreenHeight < 667)
#define kIsIphone4or4s (kScreenHeight <= 480)

// tab bar / navigation bar
#define kNavBarHeight  (44.0)
#define kStatusBarHeight (20.0)
#define kTabBarHeight (49.0)
#define kNavHeight (64.0)

// 获取宽、高缩放比例
#define kWidthScale (kScreenWidth / 320.0)
#define kHeightScale (kScreenHeight / 568.0)

#define kFontWithSize(size) [UIFont systemFontOfSize:size]
#define kBoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

// color
///< format：0xFFFFFF
#define k16RGBColor(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
///< format：22,22,22
#define kRGBColor(r, g, b) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue:(b) / 255.0  \
alpha:1])
///< format：22,22,22,0.5
#define kRGBAColor(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue:(b) / 255.0  \
alpha:(a)])

#define kColorWith16RGB(rgb) k16RGBColor(rgb)
#define kColorWithRGB(r,g,b) kRGBColor(r,g,b)
#define kColorWithRGBA(r,g,b,a) kRGBAColor(r, g, b, a)

// image
// Only load png image successfully.
#define kImageWithName(Name) ([UIImage imageNamed:Name])
#define kBigImageWithName(Name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:Name ofType:nil]])

// singleton
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kNotificationCenter  [NSNotificationCenter defaultCenter]

// 发送通知API
#define kPostNotificationWithName(notificationName) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:nil]

#define kPostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]

// empty
#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

#define kIsNull(obj) ([obj isKindOfClass:[NSNull class]])
// 是否是无效字典
#define kIsInvalidDict(objDict) (objDict == nil || ![objDict isKindOfClass:[NSDictionary class]])
// 是否是无效数组
#define kIsInvalidArray(objArray) (objArray == nil || ![objArray isKindOfClass:[NSArray class]])

// 线高
//
#define kLineHeight 0.5

//
// 灰色区，颜色由深到浅
//
#define kBColor kColorWith16RGB(0x000000)
#define kCColor [UIColor clearColor]
#define kG1Color kColorWith16RGB(0x323232)
#define kG2Color kColorWith16RGB(0x646464)
#define kG3Color kColorWith16RGB(0x969696)
#define kG4Color kColorWith16RGB(0xc8c8c8) // 仅使用标题栏分割线
#define kG5Color kColorWith16RGB(0xcccccc) // 主页面分割线
#define kG6Color kColorWith16RGB(0xf0f0f0) // 仅用于背景灰
#define kWColor kColorWith16RGB(0xffffff)  // 白色

#define kNavColer kColorWith16RGB(0x48aeff) // 导航颜色
#define kBgColor  kColorWith16RGB(0xededed) // 界面背景颜色
#define kHolderTipColor kColorWith16RGB(0xafafaf) // 提示：输入框，这个提示语的颜色
#define kButtonBlueColor kColorWith16RGB(0x41acff)

//
// 三大色调
//
#define kEssentialColor kColorWith16RGB(0x48aeff)  // 主色调，蓝色
#define kAssistOrangeColor kColorWith16RGB(0xff8c28)  // 辅色调，橙色
#define kAssistGreenColor kColorWith16RGB(0x5abe00)  // 辅色调，绿色

//
// 字号定义区
//
#define kNavFontSize 17 // 仅用于标题栏上，大标题字号
#define kNavFontBold kBoldFontWithSize(17)
#define kNavFont kFontWithSize(17)

#define kTitleFontSize 16 // 标题字号
#define kTitleFontBold kBoldFontWithSize(16)
#define kTitleFont kFontWithSize(16)

#define k15FontSize 15 // 正文字号
#define k15Font kFontWithSize(15)

#define kBodyFontSize 14 // 正文字号
#define kBodyFont kFontWithSize(14)

#define k13FontSize 13 // 正文字号
#define k13Font kFontWithSize(13)

#define kAssistFontSize 12
#define kAssistFont kFontWithSize(12) // 辅助字号

//按钮默认的字体颜色 字体 角度
#define kBtFontColor  [UIColor blackColor]
#define kBtFontSize  13
#define kBtCornerRadius  3
#define kBtBackColor  [UIColor whiteColor]


#endif /* XLPDefine_h */

