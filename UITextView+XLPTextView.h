//
//  UITextView+placeholder.h
//  UITabBarVCDemo
//
//  Created by xulianpeng on 16/8/3.
//  Copyright © 2016年 xulianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (placeholder)
/**
*  author xulianpeng 16/8/3
*
*  @说明   初始化时 若textview.text的赋值要写在 初始化placeholder要放在所有需要初始化参数的后面.
*  @param placeholder       自定义预留字
*  @param placeholderColor  默认颜色已经设置 可以自定义
*  @param placeholderFont   默认和uitextview的font大小一样,否则会出现光标比预留字长的现象,故一般不需设置,
*  @param placeholderPosition  默认居中显示,若不设置placeholderFont(预留字字体),则此属性也不需要设置;否则,通过此属性可调节预留字与光标的相对位置 ,切记 若要自定义 只能初始化为 "bottom" 或 "middle".其中 middle已经是默认的 无需再次设置.
*  @param placeholderLabel  一般不需要此参数
*
*/
@property(nonatomic,copy)NSString *xlp_placeholder;
@property(nonatomic,strong)UIColor *xlp_placeholderColor;
@property(nonatomic,strong)UIFont *xlp_placeholderFont;
@property(nonatomic,copy)NSString *xlp_placeholderPosition;
/**
 *  此参数可以忽略
 */
@property(nonatomic,strong)UILabel *xlp_placeholderLabel;

@end
