//
//  XlpRefreshHeaderView.h
//  Meiqia
//
//  Created by xulianpeng on 18/2/5.
//  Copyright © 2018年 xulianpeng. All rights reserved.
//

#import "XlpRefreshHeaderView.h"
#import "CircleView.h"
#define refreshHeight ([[UIApplication sharedApplication] statusBarFrame].size.height + 44)
@interface XlpRefreshHeaderView ()
@property(strong,nonatomic)UILabel *statusLabel;
@property(assign,nonatomic)XlpRefreshState state;
@property(nonatomic,strong)UIScrollView *xlpRootScrollView;
@end

@implementation XlpRefreshHeaderView
{
    CircleView *circleView;
    CGFloat naviBarHeight;
    UIActivityIndicatorView * activityView1;
}
-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
        
        naviBarHeight  = rect.size.height + 44;
        
        self.backgroundColor = [UIColor whiteColor];
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width-200)/2, frame.size.height - 20.0f, 200, 20.0f)];
        _statusLabel.font = [UIFont boldSystemFontOfSize:13.0f];
        _statusLabel.textColor = [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0];
        _statusLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:_statusLabel];

        
        activityView1 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView1.frame = CGRectMake(frame.size.width/2-10, frame.size.height - 20.0f, 20, 20);
        [self addSubview:activityView1];
        activityView1.hidden = YES;
        activityView1.hidesWhenStopped = YES;
        
        circleView = [[CircleView alloc]initWithFrame:CGRectMake(frame.size.width/2-10, frame.size.height - 20.0f, 20, 20)];
        [self addSubview:circleView];
        circleView.progress = 0.1;
        
        
    }
    [self setState:XlpRefreshNormal];
    
    return self;
}

- (void)setState:(XlpRefreshState)aState{
    
    switch (aState) {
        case XlpRefreshNormal:
            _statusLabel.text = @"下拉可以刷新";
            if ([activityView1 isAnimating]) {
                [activityView1 stopAnimating];
            }
            break;
        case XlpRefreshPulling:
            _statusLabel.text = @"松开立即刷新";
            break;
       
        case XlpRefreshLoading:
            _statusLabel.text = @"正在刷新数据中...";
            [activityView1 startAnimating];
            break;
        default:
            break;
    }
    
    _state = aState;
}

#pragma mark - ScrollView Methods

- (void)xlpRefreshScrollViewDidScroll:(UIScrollView *)scrollView {
   
    CGFloat newContentOffSetY = -scrollView.contentOffset.y - naviBarHeight;
    CGFloat aProgress = (newContentOffSetY)/(refreshHeight);
    circleView.progress = aProgress;
    
    if (aProgress >= 1) {
        activityView1.hidden = NO;
        circleView.hidden = YES;
    }else{
        activityView1.hidden = YES;
        circleView.hidden = NO;
    }
    
    self.xlpRootScrollView = scrollView;
    if (_statusLabel.hidden) {
        _statusLabel.hidden = NO;
    }
    if (_state == XlpRefreshLoading) {
        return;
    }
    if (_state == XlpRefreshPulling && -newContentOffSetY > -refreshHeight) {
        [self setState:XlpRefreshNormal];
    } else
        if (_state == XlpRefreshNormal && -newContentOffSetY <= -refreshHeight ) {
        [self setState:XlpRefreshPulling];
    }
}
- (void)xlpRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
    
    CGFloat newContentOffSetY = -scrollView.contentOffset.y - naviBarHeight;
    if (newContentOffSetY > refreshHeight) {
        [self setState:XlpRefreshLoading];
        self.xlpRootScrollView.contentInset = UIEdgeInsetsMake(refreshHeight, 0.0f, 0.0f, 0.0f);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self fgRefreshScrollViewDataSourceDidFinishedLoading:scrollView];
        });
    }
    
}
- (void)fgRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerLoadMoreData)]) {
        [self.delegate headerLoadMoreData];
    }
}
- (void)xlpEndRefresh{
    [UIView animateWithDuration:0.3 animations:^{
        self->_statusLabel.hidden = YES;
        [self.xlpRootScrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    } completion:^(BOOL finished) {
        [self setState:XlpRefreshNormal];
    }];
    
}


@end
