//
//  UIControl+HDFControl.h
//  DEMO
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HDFDefine.h"

//
// 值改变时的回调block
//
//typedef void(^HDFSwitchValueChangedBlock)(UISwitch *sender);
//typedef void(^HDFValueChangedBlock)(id sender);

/**
 *  @author Huangyibiao
 *
 *  给UIControl添加扩展方法，追加touch down和touch up事件的block
 *
 *  @since v0.1
 */
@interface UIControl (XLPControl)

/**
 *  按钮按下事件回调
 */
@property (nonatomic, copy) XLPButtonBlock xlp_touchDown;

/**
 *  按钮松开事件回调
 */
@property (nonatomic, copy) XLPButtonBlock xlp_touchUp;

/**
 *  值改变时的回调block
 */
@property (nonatomic, copy) XLPValueChangedBlock xlp_valueChangedBlock;

@end
