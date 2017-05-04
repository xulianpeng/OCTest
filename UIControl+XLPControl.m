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

- (void)setXlp_touchDown:(XLPButtonBlock)xlp_touchDown {
  objc_setAssociatedObject(self, s_XLPButtonTouchDownKey, xlp_touchDown, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
  
  if (xlp_touchDown) {
    [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
  }
}

- (XLPButtonBlock)xlp_touchDown {
  XLPButtonBlock downBlock = objc_getAssociatedObject(self, s_XLPButtonTouchDownKey);
  return downBlock;
}
- (void)setXlp_touchUp:(XLPButtonBlock)xlp_touchUp {
  objc_setAssociatedObject(self, s_XLPButtonTouchUpKey, xlp_touchUp, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
  
  if (xlp_touchUp) {
    [self addTarget:self action:@selector(onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
  }
}
- (XLPButtonBlock)xlp_touchUp {
  XLPButtonBlock upBlock = objc_getAssociatedObject(self, s_XLPButtonTouchUpKey);
  return upBlock;
}
- (void)setXlp_valueChangedBlock:(XLPValueChangedBlock)xlp_valueChangedBlock{
  objc_setAssociatedObject(self, s_XLPValueChangedKey, xlp_valueChangedBlock, OBJC_ASSOCIATION_COPY);
  
  [self removeTarget:self action:@selector(onValueChanged:) forControlEvents:UIControlEventTouchUpInside];
  
  if (xlp_valueChangedBlock) {
    [self addTarget:self action:@selector(onValueChanged:) forControlEvents:UIControlEventValueChanged];
  }
}

- (XLPValueChangedBlock)xlp_valueChangedBlock {
  XLPValueChangedBlock block = objc_getAssociatedObject(self, s_XLPValueChangedKey);
  return block;
}

- (void)onValueChanged:(id)sender {
  XLPValueChangedBlock block = [self xlp_valueChangedBlock];
  
  if (block) {
    block(sender);
  }
}

- (void)onTouchUp:(UIButton *)sender {
  XLPButtonBlock touchUp = [self xlp_touchUp];
  
  if (touchUp) {
    touchUp(sender);
  }
}

- (void)onTouchDown:(UIButton *)sender {
  XLPButtonBlock touchDown = [self xlp_touchDown];
  
  if (touchDown) {
    touchDown(sender);
  }
}

@end
