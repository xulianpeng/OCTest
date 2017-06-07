//
//  UITextView+XLPTextView.m
//  UITabBarVCDemo
//
//  Created by xulianpeng on 16/8/3.
//  Copyright © 2016年 xulianpeng. All rights reserved.
//

#import "UITextView+XLPTextView.h"
#import "Masonry.h"
#import <objc/runtime.h>
#define kColorWith16RGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define  placeMakeLeft  3
#define  placeMakeTop   8
static const void *s_XLPTextViewPlaceholderLabelKey = "s_XLPTextViewPlaceholderLabelKey";
static const void *s_XLPTextViewPlaceholderTextKey = "s_XLPTextViewPlaceholderTextKey";
static const void *s_XLPTextViewPlaceholderColorKey = "s_XLPTextViewPlaceholderColorKey";
static const void *s_XLPTextViewPlaceholderFontKey = "s_XLPTextViewPlaceholderFontKey";
static const void *s_XLPTextViewPlaceholderPositionKey = "s_XLPTextViewPlaceholderPositionKey";
/**
 *  首先 类目为已知类添加方法,不能添加属性,所以这里需采用runtime才能给其添加属性
 *  如果子类化时 可以在初始化的过程中给UITextView添加placeholderLabel,但是现在使用的是类目 显然不能通过此方法 
 *  当然你可以再添加一个属性 ,但是 我不想把不必要的属性暴露出来.
 */

@implementation UITextView (placeholder)
- (void)setXlp_placeholderLabel:(UILabel *)xlp_placeholderLabel
{
    objc_setAssociatedObject(self, s_XLPTextViewPlaceholderLabelKey, xlp_placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UILabel *)xlp_placeholderLabel
{
    
    UILabel *label = objc_getAssociatedObject(self, s_XLPTextViewPlaceholderLabelKey);
    
    if (label == nil || ![label isMemberOfClass:[UILabel class]]) {
        
        label = [[UILabel alloc]init];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self).offset(placeMakeLeft);
            make.top.mas_equalTo(self).offset(placeMakeTop);
        }];
        
        self.xlp_placeholderLabel = label;
        self.xlp_placeholderLabel.text = self.xlp_placeholder;
        self.xlp_placeholderLabel.textColor = (self.xlp_placeholderColor == nil ? kColorWith16RGB(0xafafaf) : self.xlp_placeholderColor);
        
        if (self.xlp_placeholderFont != nil) {
            
            CGFloat topOffset = (self.font.lineHeight - self.xlp_placeholderFont.lineHeight) > 0 ? (self.font.lineHeight - self.xlp_placeholderFont.lineHeight) : 0 ;
            
            self.xlp_placeholderLabel.font = self.xlp_placeholderFont;
            
            CGFloat newTopOffset = 0;
             if ([self.xlp_placeholderPosition isEqualToString:@"middle"] || self.xlp_placeholderPosition == nil){
                 newTopOffset = topOffset/2;
                
             }else if ([self.xlp_placeholderPosition isEqualToString:@"bottom"]) {
                 
                 newTopOffset = topOffset;
             }
            
            [label mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.top.mas_equalTo(self).offset(placeMakeTop + newTopOffset);
            }];
            
        }else
        {
            self.xlp_placeholderLabel.font = self.font;
        }
    }
    return label;
    
}

- (void)xlp_placehoderTextChange:(NSNotification *)nofitication
{
    id object = nofitication.object;
    if ([object isKindOfClass:[UITextView class]]) {
        if (self.text.length > 0) {
            self.xlp_placeholderLabel.hidden = YES;
        } else {
            self.xlp_placeholderLabel.hidden = NO;
        }
    }
    
}
- (void)setXlp_placeholder:(NSString *)xlp_placeholder
{
    objc_setAssociatedObject(self, s_XLPTextViewPlaceholderTextKey, xlp_placeholder, OBJC_ASSOCIATION_COPY);
    if (self.text.length > 0) {
        self.xlp_placeholderLabel.hidden = YES;
    } else {
        self.xlp_placeholderLabel.hidden = NO;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(xlp_placehoderTextChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];
}
- (NSString *)xlp_placeholder
{
    return objc_getAssociatedObject(self, s_XLPTextViewPlaceholderTextKey);
}
- (void)setXlp_placeholderColor:(UIColor *)xlp_placeholderColor
{
    objc_setAssociatedObject(self, s_XLPTextViewPlaceholderColorKey, xlp_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)xlp_placeholderColor
{
    return objc_getAssociatedObject(self, s_XLPTextViewPlaceholderColorKey);
}
- (void)setXlp_placeholderFont:(UIFont *)xlp_placeholderFont
{
    objc_setAssociatedObject(self, s_XLPTextViewPlaceholderFontKey, xlp_placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIFont *)xlp_placeholderFont
{
    return objc_getAssociatedObject(self, s_XLPTextViewPlaceholderFontKey);
}
- (void)setXlp_placeholderPosition:(NSString *)xlp_placeholderPosition
{
    objc_setAssociatedObject(self, s_XLPTextViewPlaceholderPositionKey, xlp_placeholderPosition, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)xlp_placeholderPosition
{
    return objc_getAssociatedObject(self, s_XLPTextViewPlaceholderPositionKey);
}

@end
