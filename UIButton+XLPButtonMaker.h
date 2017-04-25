//
//  UIButton+XLPButtonMaker.h
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * @author huangyibiao
 *
 * 所有API都基于Masonary
 */
@interface UIButton (XLPButtonMaker)


/**
 创建文字 button  基础方法

 @param title <#title description#>
 @param color <#color description#>
 @param fontSize <#fontSize description#>
 @param backColor <#backColor description#>
 @param corner <#corner description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @param touchDown <#touchDown description#>
 @return <#return value description#>
 */
+ (UIButton *)xlp_buttonWithTitle:(NSString *)title
                       titleColor:(UIColor *)color
                             font:(CGFloat)fontSize
                        backColor:(UIColor *)backColor
                           corner:(CGFloat)corner
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                        touchDown:(XLPButtonBlock)touchDown;

/**
 简化 文字 button

 @param title <#title description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @param touchDown <#touchDown description#>
 @return <#return value description#>
 */
+ (UIButton *)xlp_buttonWithTitle:(NSString *)title
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                        touchDown:(XLPButtonBlock)touchDown;

/**
 创建图片 button的简化方法

 @param image <#image description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @param touchDown <#touchDown description#>
 @return <#return value description#>
 */
+ (UIButton *)xlp_buttonWithImage:(id)image
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                        touchDown:(XLPButtonBlock)touchDown;

/**
 创建图片button 的基础方法

 @param image <#image description#>
 @param selectedImage <#selectedImage description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @param touchDown <#touchDown description#>
 @return <#return value description#>
 */
+ (UIButton *)xlp_buttonWithImage:(id)image
                    selectedImage:(id)selectedImage
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                        touchDown:(XLPButtonBlock)touchDown;
@end
