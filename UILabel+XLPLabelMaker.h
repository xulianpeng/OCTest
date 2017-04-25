//
//  UILabel+XLPLabelMaker.h
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HDFKit.h"

@interface UILabel(XLPLabelMaker)


/**
 uilabel 的简化创建方法

 @param text <#text description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @return <#return value description#>
 */
+ (UILabel *)xlp_labelWithText:(NSString *)text
                     superView:(UIView *)superView
                   constraints:(XLPConstraintMaker)constraints;

/**
 UILabel 的根创建方法

 @param text <#text description#>
 @param textColor <#textColor description#>
 @param font <#font description#>
 @param alignment <#alignment description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @return <#return value description#>
 */
+ (UILabel *)xlp_labelWithText:(NSString *)text
                     textColor:(UIColor *)textColor
                          font:(UIFont *)font
                     alignment:(NSTextAlignment)alignment
                     superView:(UIView *)superView
                   constraints:(XLPConstraintMaker)constraints;

@end
