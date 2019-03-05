//
//  XlpRefreshHeaderView.h
//  Meiqia
//
//  Created by xulianpeng on 18/2/5.
//  Copyright © 2018年 xulianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    XlpRefreshPulling = 0,
    XlpRefreshNormal,
    XlpRefreshLoading,
} XlpRefreshState;


@protocol XlpRefreshHeaderViewDelegate <NSObject>
@optional
- (void)headerLoadMoreData;
- (void)footerLoadMoreData;
@end

@interface XlpRefreshHeaderView : UIView<UIScrollViewDelegate>

@property(nonatomic,weak)id<XlpRefreshHeaderViewDelegate>delegate;

- (void)xlpRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)xlpRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView ;
- (void)xlpEndRefresh;
@end
