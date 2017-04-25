//
//  UIControl+XLPControl.m
//  DEMO
//
// Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "UIControl+XLPControl.h"
#import <objc/runtime.h>

// TouchDown/TouchUp事件的key
static const void *s_XLPButtonTouchDownKey = "s_XLPButtonTouchDownKey";
static const void *s_XLPButtonTouchUpKey = "s_XLPButtonTouchUpKey";
static const void *s_XLPValueChangedKey = "s_XLPValueChangedKey";


@implementation UIControl (XLPControl)

- (void)setXLP_touchDown:(XLPButtonBlock)touchDown {
  objc_setAssociatedObject(self, s_XLPButtonTouchDownKey, touchDown, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
  
  if (touchDown) {
    [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
  }
}

- (XLPButtonBlock)XLP_touchDown {
  XLPButtonBlock downBlock = objc_getAssociatedObject(self, s_XLPButtonTouchDownKey);
  return downBlock;
}

- (void)setXLP_touchUp:(XLPButtonBlock)touchUp {
  objc_setAssociatedObject(self, s_XLPButtonTouchUpKey, touchUp, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
  
  if (touchUp) {
    [self addTarget:self action:@selector(onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
  }
}

- (XLPButtonBlock)XLP_touchUp {
  XLPButtonBlock upBlock = objc_getAssociatedObject(self, s_XLPButtonTouchUpKey);
  return upBlock;
}

- (void)setXLP_valueChangedBlock:(XLPValueChangedBlock)valueChangedBlock {
  objc_setAssociatedObject(self, s_XLPValueChangedKey, valueChangedBlock, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(onValueChanged:) forControlEvents:UIControlEventTouchUpInside];
  
  if (valueChangedBlock) {
    [self addTarget:self action:@selector(onValueChanged:) forControlEvents:UIControlEventValueChanged];
  }
}

- (XLPValueChangedBlock)XLP_valueChangedBlock {
  XLPValueChangedBlock block = objc_getAssociatedObject(self, s_XLPValueChangedKey);
  return block;
}

- (void)onValueChanged:(id)sender {
  XLPValueChangedBlock block = [self XLP_valueChangedBlock];
  
  if (block) {
    block(sender);
  }
}

- (void)onTouchUp:(UIButton *)sender {
  XLPButtonBlock touchUp = [self XLP_touchUp];
  
  if (touchUp) {
    touchUp(sender);
  }
}

- (void)onTouchDown:(UIButton *)sender {
  XLPButtonBlock touchDown = [self XLP_touchDown];
  
  if (touchDown) {
    touchDown(sender);
  }
}

@end
