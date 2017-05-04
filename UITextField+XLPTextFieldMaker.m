//
//  UITextField+XLPTextFieldMaker.m
//  OCTest
//
//  Created by lianpeng on 2017/4/26.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "UITextField+XLPTextFieldMaker.h"

@implementation UITextField (XLPTextFieldMaker)


/**
 textfield 的基本方法

 @param placeholder <#placeholder description#>
 @param color <#color description#>
 @param fontSize <#fontSize description#>
 @param borderStyle <#borderStyle description#>
 @param secureBool <#secureBool description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @return <#return value description#>
 */
+ (UITextField *)xlp_textFieldWithPlaceholder:(NSString *)placeholder
                                        color:(UIColor *)color
                                         font:(CGFloat)fontSize
                                   boderStyle:(UITextBorderStyle)borderStyle
                              secureTextEntry:(BOOL)secureBool
                                    superView:(UIView *)superView
                                  constraints:(XLPConstraintMaker)constraints {
    
    UITextField *textField = [[UITextField alloc]init];
    [superView addSubview:textField];
    if (constraints) {
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    textField.placeholder = placeholder;
    textField.font = kFontWithSize(fontSize);
    textField.textColor = color;
    textField.borderStyle = borderStyle;
    textField.secureTextEntry =  secureBool;
    return textField;
}

/**
 textfield 的简化方法

 @param placeholder <#placeholder description#>
 @param color <#color description#>
 @param fontSize <#fontSize description#>
 @param superView <#superView description#>
 @param constraints <#constraints description#>
 @return <#return value description#>
 */
+ (UITextField *)xlp_textFieldWithPlaceholder:(NSString *)placeholder
                                        color:(UIColor *)color
                                         font:(CGFloat)fontSize
                                    superView:(UIView *)superView
                                  constraints:(XLPConstraintMaker)constraints {
    
    UITextField *textField = [[UITextField alloc]init];
    [superView addSubview:textField];
    if (constraints) {
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    textField.placeholder = placeholder;
    textField.font = kFontWithSize(fontSize);
    textField.textColor = color;
    return textField;
}
@end
