//
//  CircleView.m
//  Meiqia
//
//  Created by xulianpeng on 2018/2/8.
//  Copyright © 2018年 xulianpeng. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.circleLayer = [CircleLayer layer];
        self.circleLayer.frame = self.bounds;
        //像素大小比例
        self.circleLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleLayer];
        
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    self.circleLayer.progress = progress;
    [self.circleLayer setNeedsDisplay];
}

@end
