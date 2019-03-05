//
//  XlpRefreshFooterView.h
//  OCTest
//
//  Created by xulianpeng on 2019/3/4.
//  Copyright © 2019 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol XlpRefreshFooterViewDelegate <NSObject>
@optional
- (void)headerLoadMoreData;
- (void)footerLoadMoreData;
@end

@interface XlpRefreshFooterView : UIView<UIScrollViewDelegate>

@property(nonatomic,weak)id<XlpRefreshFooterViewDelegate>delegate;

- (void)xlpRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)xlpRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView ;
- (void)xlpEndRefresh;
@end

NS_ASSUME_NONNULL_END
