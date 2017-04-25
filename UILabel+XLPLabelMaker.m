//
//  UILabel+HDFLabelMaker.m
//  HDFKitByHuangyibiao
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "UILabel+XLPLabelMaker.h"

@implementation UILabel (XLPLabelMaker)


+ (UILabel *)xlp_labelWithText:(NSString *)text
                     superView:(UIView *)superView
                   constraints:(XLPConstraintMaker)constraints {
  return [self xlp_labelWithText:text
                       textColor:[UIColor blackColor]
                            font:kFontWithSize(13)
                       alignment:NSTextAlignmentLeft
                       superView:superView
                     constraints:constraints];
}

+ (UILabel *)xlp_labelWithText:(NSString *)text
                     textColor:(UIColor *)textColor
                          font:(UIFont *)font
                     alignment:(NSTextAlignment)alignment
                     superView:(UIView *)superView
                   constraints:(XLPConstraintMaker)constraints {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = alignment;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.backgroundColor = [UIColor whiteColor];
    [superView addSubview:label];
    if (superView && constraints) {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    return label;
}

@end
