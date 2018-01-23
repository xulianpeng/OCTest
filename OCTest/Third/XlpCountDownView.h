//
//  XlpCountDownView.h
//  OCTest
//
//  Created by xulianpeng on 2018/1/5.
//  Copyright © 2018年 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CountDownType) {
    CountDownTypeS, //简单的s 倒计时
    CountDownTypeAll, //hh:mm:ss
};

//typedef void(^CountDownBlock)(void);



@protocol XlpCountDownViewDelegate <NSObject>

@optional
- (void)countDownHandle;
- (void)countDownEndHandle;


@end

@interface XlpCountDownView : UIView

@property(nonatomic,weak)id<XlpCountDownViewDelegate> delegate;


@property(nonatomic,strong)dispatch_source_t rootTimer;

@property(nonatomic,assign)NSInteger TheCountDownTime; //倒计时总时间
//倒计时的背景色
@property(nonatomic,strong)UIColor * beforeBackColor;
@property(nonatomic,strong)UIColor * afterBackColor;
@property(nonatomic,strong)UIColor * endBackColor;


//倒计时开始前字符相关的设置
@property(nonatomic,strong)NSString *beforeStr;
@property(nonatomic,strong)UIFont *beforefont;
@property(nonatomic,strong)UIColor * beforeColor;

//倒计时开始后字符相关的设置
@property(nonatomic,strong)NSString *afterStr;
@property(nonatomic,strong)UIFont *afterFont;
@property(nonatomic,strong)UIColor * afterColor;

//倒计时结束后字符相关的设置
@property(nonatomic,strong)NSString *endStr;
@property(nonatomic,strong)UIFont *endFont;
@property(nonatomic,strong)UIColor * endColor;

- (instancetype)initWithFrame:(CGRect)frame type:(CountDownType *)type;
- (void)beginTime;
- (void)cancelTime;
@end
