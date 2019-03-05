//
//  CircleView.h
//  Meiqia
//
//  Created by xulianpeng on 2018/2/8.
//  Copyright © 2018年 xulianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleLayer.h"
@interface CircleView : UIView
@property (nonatomic, assign) CGFloat progress;
@property (strong,nonatomic) CircleLayer * circleLayer;
@end
