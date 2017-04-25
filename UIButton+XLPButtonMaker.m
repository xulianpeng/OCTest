//
//  UIButton+XLPButtonMaker.m
//  HDFKitByHuangyibiao
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "UIButton+XLPButtonMaker.h"

@implementation UIButton (XLPButtonMaker)


#pragma mark 文字 Button
+ (UIButton *)xlp_buttonWithTitle:(NSString *)title
                       titleColor:(UIColor *)color
                             font:(CGFloat)fontSize
                        backColor:(UIColor *)backColor
                           corner:(CGFloat)corner
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                          touchDown:(XLPButtonBlock)touchDown {
    UIButton *button = [XLPUIMake xlpInitWithTitle:title titleColor:color font:kFontWithSize(fontSize) backColor:backColor corner:corner superView:superView touchDown:touchDown];
    if (constraints) {
      [button mas_makeConstraints:^(MASConstraintMaker *make) {
        constraints(make);
      }];
    }
  return button;
}

+ (UIButton *)xlp_buttonWithTitle:(NSString *)title
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                        touchDown:(XLPButtonBlock)touchDown {
    UIButton *button = [XLPUIMake xlpInitWithTitle:title titleColor:kBtFontColor font:kFontWithSize(kBtFontSize) backColor:kBtBackColor corner:kBtCornerRadius superView:superView touchDown:touchDown];
    if (constraints) {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    return button;
}
#pragma mark - 图片 button
+ (UIButton *)xlp_buttonWithImage:(id)image
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                          touchDown:(XLPButtonBlock)touchDown {
  return [self xlp_buttonWithImage:image
                     selectedImage:nil
                         superView:superView
                       constraints:constraints
                           touchDown:touchDown];
}

+ (UIButton *)xlp_buttonWithImage:(id)image
                    selectedImage:(id)selectedImage
                        superView:(UIView *)superView
                      constraints:(XLPConstraintMaker)constraints
                        touchDown:(XLPButtonBlock)touchDown {
    UIButton *button = [self xlp_buttonWithTitle:nil superView:superView constraints:constraints touchDown:touchDown];
    if (image != nil) {
        if ([image isKindOfClass:[NSString class]]) {
            [button setImage:kImageWithName(image) forState:UIControlStateNormal];
        } else {
            [button setImage:image forState:UIControlStateNormal];
        }
    }
    
    if (selectedImage != nil) {
        if ([selectedImage isKindOfClass:[NSString class]]) {
            [button setImage:kImageWithName(selectedImage) forState:UIControlStateSelected];
        } else {
            [button setImage:selectedImage forState:UIControlStateSelected];
        }
    }
    
    return button;
}


@end
