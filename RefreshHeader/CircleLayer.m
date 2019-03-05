//
//  CircleLayer.m
//  Meiqia
//
//  Created by xulianpeng on 2018/2/8.
//  Copyright © 2018年 xulianpeng. All rights reserved.
//

#import "CircleLayer.h"
#import <UIKit/UIKit.h>

@implementation CircleLayer
- (void)drawInContext:(CGContextRef)ctx {
    CGFloat radius = self.bounds.size.width / 2;
    CGFloat lineWidth = 2.0;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - lineWidth / 2 startAngle:0.f endAngle:M_PI * 2 * self.progress clockwise:YES];
    CGContextSetRGBStrokeColor(ctx, 104/255.0, 192/255.0, 160/255.0, 1.0);//笔颜色 [UIColor colorWithRed:104/255.0 green:192/255.0 blue:160/255.0 alpha:1.0]
    CGContextSetLineWidth(ctx, lineWidth);//线条宽度
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}
- (instancetype)initWithLayer:(CircleLayer *)layer {
    if (self = [super initWithLayer:layer]) {
        self.progress = layer.progress;
    }
    return self;
}
+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}
@end
