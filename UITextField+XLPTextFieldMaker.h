//
//  UITextField+XLPTextFieldMaker.h
//  OCTest
//
//  Created by lianpeng on 2017/4/26.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (XLPTextFieldMaker)
+ (UITextField *)xlp_textFieldWithPlaceholder:(NSString *)placeholder
                                        color:(UIColor *)color
                                         font:(CGFloat)fontSize
                                   boderStyle:(UITextBorderStyle)borderStyle
                              secureTextEntry:(BOOL)secureBool
                                    superView:(UIView *)superView
                                  constraints:(XLPConstraintMaker)constraints;
+ (UITextField *)xlp_textFieldWithPlaceholder:(NSString *)placeholder
                                        color:(UIColor *)color
                                         font:(CGFloat)fontSize
                                    superView:(UIView *)superView
                                  constraints:(XLPConstraintMaker)constraints;
@end
