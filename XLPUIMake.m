//
//  HDFUIMaker.m
//  newPatient
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "XLPUIMake.h"
//#import "HDFNavigationView.h"

//#import "UIColor+HDFColor.h"

@implementation XLPUIMake

#pragma mark - UIButton

+ (UIButton *)xlpInitWithTitle:(NSString*)title titleColor:(UIColor *)color font:(UIFont *)font backColor:(UIColor *)backColor corner:(CGFloat)cornerRadius superView:(UIView *)superView touchDown:(XLPButtonBlock)touchDown{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [superView addSubview:button];
    button.layer.masksToBounds = YES;
    button.clipsToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    button.xlp_touchDown = touchDown;
    [button setBackgroundColor:backColor];
    return button;
}

+ (UIButton *)xlpInitWithImage:(NSString*)imageName  corner:(CGFloat)cornerRadius superView:(UIView *)superView touchDown:(XLPButtonBlock)touchDown{
    
    UIButton *button = [self xlpInitWithNormalImage:imageName highlightedImage:nil corner:cornerRadius superView:superView touchDown:touchDown];
    return button;
}
+ (UIButton *)xlpInitWithNormalImage:(NSString *)imageName
                   highlightedImage:(NSString *)highlighedImageName
                             corner:(CGFloat)cornerRadius
                          superView:(UIView *)superView
                            touchDown:(XLPButtonBlock)touchDown {
    
    UIButton *button = [self xlpInitWithTitle:nil titleColor:nil font:nil backColor:nil corner:cornerRadius superView:superView touchDown:touchDown];
    if (highlighedImageName) {
        [button setImage:[UIImage imageNamed:highlighedImageName] forState:UIControlStateHighlighted];
    }
    
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    button.imageView.contentMode = UIViewContentModeScaleAspectFill;
    button.xlp_touchUp = touchDown;
    [button sizeToFit];
    
    return button;
}


#pragma mark - 分割线
+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding top:(CGFloat)top toView:(UIView *)superView {
    return [self lineWithLeftPadding:leftPadding top:top toView:superView color:kG5Color];
}

+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding top:(CGFloat)top toView:(UIView *)superView color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = color;
    
    if (superView) {
        [superView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftPadding);
            make.top.mas_equalTo(top);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(kLineHeight);
        }];
    }
    
    return label;
}

+ (UILabel *)lineWithTop:(CGFloat)top toView:(UIView *)superView {
    return [self lineWithLeftPadding:0 top:top toView:superView];
}

+ (UILabel *)lineWithBottom:(CGFloat)bottom toView:(UIView *)superView {
    return [self lineWithLeftPadding:0 bottom:bottom toView:superView];
}

+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding bottom:(CGFloat)bottom toView:(UIView *)superView {
    return [self lineWithLeftPadding:leftPadding bottom:bottom toView:superView color:kG5Color];
}

+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding bottom:(CGFloat)bottom toView:(UIView *)superView color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = color;
    
    if (superView) {
        [superView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftPadding);
            make.bottom.mas_equalTo(-bottom);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(kLineHeight);
        }];
    }
    
    return label;
}

+ (UILabel *)lineWithTopPadding:(CGFloat)topPadding
                    leftPadding:(CGFloat)leftPadding
                         bottom:(CGFloat)bottom
                         toView:(UIView *)superView
                          color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = color;
    
    if (superView) {
        [superView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftPadding);
            make.bottom.mas_equalTo(-bottom);
            make.top.mas_equalTo(topPadding);
            make.width.mas_equalTo(kLineHeight);
        }];
    }
    
    return label;
}

#pragma mark - UILabel控件生成
+ (UILabel *)labelWithText:(NSString *)text {
    return [self labelWithText:text
                         align:NSTextAlignmentLeft
                      fontSize:kBodyFontSize
                        isBold:YES
                     textColor:kBColor
               backgroundColor:[UIColor clearColor]];
}

+ (UILabel *)labelWithText:(NSString *)text
                     align:(NSTextAlignment)align
                  fontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold
                 textColor:(UIColor *)textColor {
    return [self labelWithText:text
                         align:align
                      fontSize:fontSize
                        isBold:isBold
                     textColor:textColor
               backgroundColor:[UIColor clearColor]];
}

+ (UILabel *)labelWithText:(NSString *)text
                     align:(NSTextAlignment)align
                  fontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold {
    return [self labelWithText:text align:align fontSize:fontSize isBold:isBold textColor:kWColor];
}

+ (UILabel *)navLabelWithText:(NSString *)text {
    return [self labelWithText:text
                         align:NSTextAlignmentCenter
                      fontSize:kNavFontSize
                        isBold:YES
                     textColor:kBColor
               backgroundColor:[UIColor clearColor]];
}

+ (UILabel *)labelWithText:(NSString *)text
                     align:(NSTextAlignment)align
                  fontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold
                 textColor:(UIColor *)textColor
           backgroundColor:(UIColor *)backgroundColor {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textAlignment = align;
    label.numberOfLines = 0;
    
    if (isBold) {
        label.font = kBoldFontWithSize(fontSize);
    } else {
        label.font = kFontWithSize(fontSize);
    }
    
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    
    return label;
}

/*
#pragma mark - 底部固定工具条
+ (UIView *)bottomToolbarWithSuperView:(UIView *)superView
                             leftTitle:(NSString *)leftTitle
                            rightTitle:(NSString *)rightTitle
                             TouchLeft:(XLPButtonBlock)touchLeft
                            touchRight:(XLPButtonBlock)touchRight {
    UIView *view = [[UIView alloc] init];
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(49);
        make.top.mas_equalTo(superView.mas_bottom).offset(-49);
    }];
    
    UIButton *leftButton = [self buttonWithTitle:leftTitle
                                   normalBgColor:kG3Color
                             hightlightedBgColor:kG2Color
                                          toView:view
                                         touchUp:touchLeft];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(view.mas_centerX).offset(-5);
    }];
    leftButton.tag = 100;
    
    UIButton *rightButton = [self buttonWithTitle:rightTitle
                                    normalBgColor:kG3Color
                              hightlightedBgColor:kG2Color
                                           toView:view
                                          touchUp:touchRight];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.mas_equalTo(leftButton);
    }];
    rightButton.tag = 101;
    
    return view;
}

#pragma mark - 导航条相关API
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock {
    return [self navWithTitle:title
                    superView:superView
                    leftBlock:leftBlock
                   rightTitle:nil
                   rightBlock:nil];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                         rightTitle:(NSString *)rightTitle
                         rightBlock:(XLPButtonBlock)rightBlock {
    if (rightBlock) {
        return [self navWithTitle:title
                        superView:superView
                        leftBlock:leftBlock
                      rightTitles: kIsEmptyString(rightTitle) ? nil : @[rightTitle]
                       rightBlock:^(NSUInteger index, UIButton *sender) {
                           if (rightBlock) {
                               rightBlock(sender);
                           }
                       }];
    }
    
    return [self navWithTitle:title
                    superView:superView
                    leftBlock:leftBlock
                  rightTitles: kIsEmptyString(rightTitle) ? nil : @[rightTitle]
                   rightBlock:nil];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                         rightImage:(NSString *)rightImage
                         rightBlock:(XLPButtonBlock)rightBlock {
    return [self navWithTitle:title
                    superView:superView
                    leftBlock:leftBlock
                   rightImage:rightImage
             highlightedImage:nil
                   rightBlock:rightBlock];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                         rightImage:(NSString *)rightImage
                   highlightedImage:(NSString *)highlightedImage
                         rightBlock:(XLPButtonBlock)rightBlock {
    if (rightBlock) {
        return [self navWithTitle:title
                        superView:superView
                        leftBlock:leftBlock
                      rightImages:@[rightImage]
                highlightedImages:highlightedImage ? @[highlightedImage] : nil
                       rightBlock:^(NSUInteger index, UIButton *sender) {
                           if (rightBlock) {
                               rightBlock(sender);
                           }
                       }];
    }
    
    return [self navWithTitle:title
                    superView:superView
                    leftBlock:leftBlock
                  rightImages:@[rightImage]
            highlightedImages:highlightedImage ? @[highlightedImage] : nil
                   rightBlock:nil];
}


+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightTitles:(NSArray *)rightTitles
                         rightBlock:(XLPButtonIndexBlock)rightBlock {
    return [self _navWithTitle:title
                     superView:superView
                     leftBlock:leftBlock
                 rightContents:rightTitles
             highlightedImages:nil
                       isImage:NO
                    rightBlock:rightBlock];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightImages:(NSArray *)rightImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock {
    return [self _navWithTitle:title
                     superView:superView
                     leftBlock:leftBlock
                 rightContents:rightImages
             highlightedImages:nil
                       isImage:YES
                    rightBlock:rightBlock];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightImages:(NSArray *)rightImages
                  highlightedImages:(NSArray *)highlightedImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock {
    return [self _navWithTitle:title
                     superView:superView
                     leftBlock:nil
                 rightContents:rightImages
             highlightedImages:highlightedImages
                       isImage:YES
                    rightBlock:rightBlock];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftImage:(NSString *)leftImage
                      leftHighImage:(NSString *)leftHighImage
                          leftBlock:(XLPButtonBlock)leftBlock {
    return [self navWithTitle:title
                    superView:superView
                    leftImage:leftImage
                leftHighImage:leftHighImage
                    leftBlock:leftBlock
                  rightImages:nil
            highlightedImages:nil
                   rightBlock:nil];
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftImage:(NSString *)leftImage
                      leftHighImage:(NSString *)leftHighImage
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightImages:(NSArray *)rightImages
                  highlightedImages:(NSArray *)highlightedImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock {
    return [self _navWithTitle:title
                     superView:superView
                     leftImage:leftImage
                 leftHighImage:leftHighImage
                     leftBlock:leftBlock
                 rightContents:rightImages
             highlightedImages:highlightedImages
                       isImage:YES
                    rightBlock:rightBlock];
}

// 自定义导航titleView，有默认的返回按钮
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock {
    HDFNavigationView *navView = [self navWithTitleView:titleView superView:superView];
    [navView setLeftBarButtonItemWithImageName:kDefaultNavImageName
                          highlightedImageName:kDefaultNavHightlightedImageName
                                       touchUp:leftBlock];
    navView.titleView = titleView;
    
    return navView;
}

+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock
                            rightTitles:(NSArray *)rightTitles
                             rightBlock:(XLPButtonIndexBlock)rightBlock {
    HDFNavigationView *navView = [self navWithTitleView:titleView superView:superView];
    [navView setLeftBarButtonItemWithImageName:kDefaultNavImageName
                          highlightedImageName:kDefaultNavHightlightedImageName
                                       touchUp:leftBlock];
    navView.titleView = titleView;
    [navView setRightBarButtonItemsWithTitles:rightTitles touchUp:rightBlock];
    
    return navView;
}

// rightImages可以全是图片名称，也可以全是图片对象
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock
                            rightImages:(NSArray *)rightImages
                             rightBlock:(XLPButtonIndexBlock)rightBlock {
    return [self navWithTitleView:titleView
                        superView:superView
                        leftBlock:leftBlock
                      rightImages:rightImages
                  rightHighImages:nil
                       rightBlock:rightBlock];
}

+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock
                            rightImages:(NSArray *)rightImages
                        rightHighImages:(NSArray *)rightHighImages
                             rightBlock:(XLPButtonIndexBlock)rightBlock {
    HDFNavigationView *navView = [self navWithTitleView:titleView superView:superView];
    [navView setLeftBarButtonItemWithImageName:kDefaultNavImageName
                          highlightedImageName:kDefaultNavHightlightedImageName
                                       touchUp:leftBlock];
    navView.titleView = titleView;
    
    if (!kIsInvalidArray(rightImages)) {
        NSString *img = rightImages[0];
        if ([img isKindOfClass:[UIImage class]]) {
            [navView setRightBarButtonItemsWithImages:rightImages
                                    highlightedImages:rightHighImages
                                              touchUp:rightBlock];
        } else {
            [navView setRightBarButtonItemsWithImageNames:rightImages
                                    highlightedImageNames:rightHighImages
                                                  touchUp:rightBlock];
        }
    }
    
    
    return navView;
}



// 自定义titleView
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                             leftTitles:(NSArray *)leftTitles
                              leftBlock:(XLPButtonIndexBlock)leftBlock
                            rightTitles:(NSArray *)rightTitles
                             rightBlock:(XLPButtonIndexBlock)rightBlock {
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    navView.titleView = titleView;
    [navView setLeftBarButtonItemsWithTitles:leftTitles touchUp:leftBlock];
    [navView setRightBarButtonItemsWithTitles:rightTitles touchUp:rightBlock];
    
    return navView;
}

+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                            rightTitles:(NSArray *)rightTitles
                             rightBlock:(XLPButtonIndexBlock)rightBlock {
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    navView.titleView = titleView;
    [navView setRightBarButtonItemsWithTitles:rightTitles touchUp:rightBlock];
    
    return navView;
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        rightTitles:(NSArray *)rightTitles
                         rightBlock:(XLPButtonIndexBlock)rightBlock {
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    [navView setTitleViewWithTitle:title];
    [navView setRightBarButtonItemsWithTitles:rightTitles touchUp:rightBlock];
    
    return navView;
}

+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        rightImages:(NSArray *)rightImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock {
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    [navView setTitleViewWithTitle:title];
    
    if (!kIsInvalidArray(rightImages)) {
        NSString *img = rightImages[0];
        if ([img isKindOfClass:[UIImage class]]) {
            [navView setRightBarButtonItemsWithImageNames:rightImages touchUp:rightBlock];
        } else {
            [navView setRightBarButtonItemsWithImageNames:rightImages touchUp:rightBlock];
        }
    }
    
    return navView;
}


+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView {
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    [navView setTitleViewWithTitle:title];
    return navView;
}

+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView {
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    navView.titleView = titleView;
    
    return navView;
}

#pragma mark - UISwitch开关组件
+ (UISwitch *)switchWithChangedBlock:(XLPSwitchValueChangedBlock)block {
    UISwitch *sw = [[UISwitch alloc] init];
    sw.xlp_valueChangedBlock = block;
    sw.tintColor = kG6Color;
    sw.thumbTintColor = [UIColor whiteColor];
    sw.backgroundColor = kG6Color;
    sw.clipsToBounds = YES;
    sw.layer.masksToBounds = YES;
    sw.layer.cornerRadius = 15;
    
    return sw;
}

#pragma mark - ImageView组件
+ (UIImageView *)imageViewWithSize:(CGSize)size {
    return [self imageViewWithSize:size isCircle:NO];
}

+ (UIImageView *)imageViewWithSize:(CGSize)size isCircle:(BOOL)isCircle {
    return [self imageViewWithFrame:CGRectMake(0, 0, size.width, size.height)
                          superView:nil isCircle:isCircle];
}

+ (UIImageView *)imageViewWithImageName:(NSString *)imgName {
    return [self imageViewWithImage:kImageWithName(imgName)];
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image {
    UIImageView *imgView = [self imageViewWithSize:image.size];
    
    imgView.image = image;
    //  [imgView sizeToFit];
    
    return imgView;
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame superView:(UIView *)superView {
    return [self imageViewWithFrame:frame superView:superView isCircle:NO];
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                          superView:(UIView *)superView
                           isCircle:(BOOL)isCircle {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = frame;
    
    if (superView) {
        [superView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(frame.origin.x);
            make.top.mas_equalTo(frame.origin.y);
            make.size.mas_equalTo(frame.size);
        }];
    } else {
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(frame.size);
        }];
    }
    
    if (isCircle) {
        CGFloat w = frame.size.width > frame.size.height ? frame.size.width : frame.size.height;
        imgView.layer.cornerRadius = w / 2.0;
    }
    
    return imgView;
}

#pragma mark - UITableView控件
+ (UITableView *)tableViewWithDelegate:(id)delegate {
    return [self tableViewWithDelegate:delegate style:UITableViewStylePlain];
}

+ (UITableView *)tableViewWithDelegate:(id)delegate style:(UITableViewStyle)style {
    return [self tableViewWithDelegate:delegate superView:nil style:style];
}

+ (UITableView *)tableViewWithDelegate:(id)delegate superView:(UIView *)superView {
    return [self tableViewWithDelegate:delegate superView:superView style:UITableViewStylePlain];
}

+ (UITableView *)tableViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 style:(UITableViewStyle)style {
    return [self tableViewWithDelegate:delegate
                             superView:superView
                                 style:style
                                 edges:UIEdgeInsetsZero];
}

+ (UITableView *)tableViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 edges:(UIEdgeInsets)edges {
    return [self tableViewWithDelegate:delegate
                             superView:superView
                                 style:UITableViewStylePlain
                                 edges:edges];
}

+ (UITableView *)tableViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 style:(UITableViewStyle)style
                                 edges:(UIEdgeInsets)edges {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    
    if (superView) {
        [superView addSubview:tableView];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).insets(edges);
        }];
    }
    
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.pagingEnabled = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.showsHorizontalScrollIndicator = NO;
    
    return tableView;
}

#pragma mark - UIScrollView控件
+ (UIScrollView *)scrollViewWithDelegate:(id)delegate {
    return [self scrollViewWithDelegate:delegate superView:nil];
}

+ (UIScrollView *)scrollViewWithDelegate:(id)delegate superView:(UIView *)superView {
    return [self scrollViewWithDelegate:delegate superView:superView edges:UIEdgeInsetsZero];
}

+ (UIScrollView *)scrollViewWithDelegate:(id)delegate superView:(UIView *)superView edges:(UIEdgeInsets)edges {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    if (superView) {
        [superView addSubview:scrollView];
        
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).insets(edges);
        }];
    }
    
    scrollView.delegate = delegate;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    
    return scrollView;
}

#pragma mark - 网络请求失败界面组件
+ (UIView *)failureViewWithSuperView:(UIView *)superView
                               image:(id)image
                                 tip:(NSString *)tip
                            callback:(XLPGestureBlock)callback {
    return [self failureViewWithSuperView:superView
                                      top:0
                                    image:image
                                      tip:tip
                                 callback:callback];
}

+ (UIView *)failureViewWithSuperView:(UIView *)superView
                                 top:(CGFloat)top
                               image:(id)image
                                 tip:(NSString *)tip
                            callback:(XLPGestureBlock)callback {
    UIView *failureView = [[UIView alloc] init];
    failureView.backgroundColor = kG6Color;
    [superView addSubview:failureView];
    
    if (superView) {
        if ([superView isKindOfClass:[UIScrollView class]] || [superView isKindOfClass:[UITableView class]]) {
            [failureView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(top);
                make.left.mas_offset(0);
                make.height.mas_equalTo(superView.height);
                make.width.mas_equalTo(superView.width);
            }];
        } else {
            [failureView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(superView).insets(UIEdgeInsetsMake(top, 0, 0, 0));
            }];
        }
    }
    
    UIImageView *imgView = nil;
    if ([image isKindOfClass:[NSString class]]) {
        imgView = [self imageViewWithImageName:image];
    } else if ([image isKindOfClass:[UIImage class]]) {
        imgView = [self imageViewWithImage:image];
    }
    
    [failureView addSubview:imgView];
    
    const CGFloat kMaxTipLabelHeight = 40.0;
    
    [imgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(failureView);
        make.size.mas_lessThanOrEqualTo(CGSizeMake(kScreenWidth, kScreenWidth));
        make.centerY.equalTo(failureView).offset(-kMaxTipLabelHeight);
    }];
    
    UILabel *tipLabel = [XLPUIMake labelWithText:tip
                                            align:NSTextAlignmentCenter
                                         fontSize:kTitleFontSize
                                           isBold:YES
                                        textColor:kBColor
                                  backgroundColor:[UIColor clearColor]];
    [failureView addSubview:tipLabel];
    tipLabel.numberOfLines = 2;
    if (image == nil) {
        [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(failureView).offset(0);
            make.width.equalTo(superView);
            make.top.mas_offset(superView.hdf_height / 2 - 42 - top);
        }];
    } else {
        [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(failureView).offset(kLeftPadding15);
            make.right.equalTo(failureView).offset(-kRightPadding15);
            make.top.mas_equalTo(imgView.mas_bottom).offset(kBottomPadding20);
            make.height.mas_lessThanOrEqualTo(kMaxTipLabelHeight);
        }];
    }
    // add gesture
    if (callback) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        tap.hdf_gestureBlock = callback;
        
        
        [failureView addGestureRecognizer:tap];
    }
    
    return failureView;
}

#pragma mark - UIWebView相关API
+ (UIWebView *)webViewWithDelegate:(id)delegate {
    return [self webViewWithDelegate:delegate superView:nil];
}

+ (UIWebView *)webViewWithDelegate:(id)delegate superView:(UIView *)superView {
    return [self webViewWithDelegate:delegate superView:superView edges:UIEdgeInsetsZero];
}

+ (UIWebView *)webViewWithDelegate:(id)delegate superView:(UIView *)superView edges:(UIEdgeInsets)edges {
    UIWebView *webView = [[UIWebView alloc] init];
    
    // 自适应屏幕大小进行缩放
    webView.userInteractionEnabled = YES;
    webView.delegate = delegate;
    webView.scalesPageToFit = YES;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    
    if (superView) {
        [superView addSubview:webView];
        
        [webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).insets(edges);
        }];
    }
    
    return webView;
}

#pragma mark - UITextField
+ (UITextField *)textFieldWithText:(NSString *)text
                         textColor:(UIColor *)textColor
                       placeholder:(NSString *)placeholder
                  placeholderColor:(UIColor *)placeholderColor
                        isSecurity:(BOOL)isSecurity
                          delegate:(id)delegate {
    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = delegate;
    textField.clipsToBounds = YES;
    textField.layer.masksToBounds = YES;
    textField.font = kBodyFont;
    textField.text = text;
    textField.textColor = textColor;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.placeholder = placeholder;
    textField.secureTextEntry = isSecurity;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    if (!kIsEmptyString(placeholder)) {
        if (placeholderColor != nil) {
            NSMutableAttributedString *attrHolder = [[NSMutableAttributedString alloc] initWithString:placeholder];
            [attrHolder setAttributes:@{NSFontAttributeName            : kBodyFont,
                                        NSForegroundColorAttributeName : placeholderColor}
                                range:NSMakeRange(0, placeholder.length)];
            textField.attributedPlaceholder = attrHolder;
        }
    }
    
    return textField;
}

+ (UITextField *)textFieldWithText:(NSString *)text
                       placeholder:(NSString *)placeholder
                          delegate:(id)delegate {
    return [self textFieldWithText:text
                         textColor:kBColor
                       placeholder:placeholder
                  placeholderColor:kG2Color
                        isSecurity:NO
                          delegate:delegate];
}

+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder delegate:(id)delegate {
    return [self textFieldWithText:nil placeholder:placeholder delegate:delegate];
}


#pragma mark - Private
// Private method
+ (HDFNavigationView *)_navWithTitle:(NSString *)title
                           superView:(UIView *)superView
                           leftImage:(NSString *)leftImage
                       leftHighImage:(NSString *)leftHighImage
                           leftBlock:(XLPButtonBlock)leftBlock
                       rightContents:(NSArray *)rightContents
                   highlightedImages:(NSArray *)highlightedImages
                             isImage:(BOOL)isImage
                          rightBlock:(XLPButtonIndexBlock)rightBlock {
    NSAssert(superView != nil, @"创建导航条工厂方法必须是非空的superView");
    HDFNavigationView *navView = [HDFNavigationView navigationViewWithSuperView:superView];
    [navView setTitleViewWithTitle:title];
    
    leftImage = kIsEmptyString(leftImage) ? kDefaultNavImageName : leftImage;
    leftHighImage = kIsEmptyString(leftHighImage) ? kDefaultNavHightlightedImageName : leftHighImage;
    
    [navView setLeftBarButtonItemWithImageName:leftImage
                          highlightedImageName:leftHighImage
                                       touchUp:leftBlock];
    
    if (!kIsInvalidArray(rightContents) && isImage) {
        [navView setRightBarButtonItemsWithImageNames:rightContents
                                highlightedImageNames:highlightedImages
                                              touchUp:rightBlock];
    } else if (!kIsInvalidArray(rightContents) && !isImage) {
        [navView setRightBarButtonItemsWithTitles:rightContents touchUp:rightBlock];
    }
    
    return navView;
}

// Private method
+ (HDFNavigationView *)_navWithTitle:(NSString *)title
                           superView:(UIView *)superView
                           leftBlock:(XLPButtonBlock)leftBlock
                       rightContents:(NSArray *)rightContents
                   highlightedImages:(NSArray *)highlightedImages
                             isImage:(BOOL)isImage
                          rightBlock:(XLPButtonIndexBlock)rightBlock {
    return [self _navWithTitle:title
                     superView:superView
                     leftImage:nil
                 leftHighImage:nil
                     leftBlock:leftBlock
                 rightContents:rightContents
             highlightedImages:highlightedImages
                       isImage:isImage
                    rightBlock:rightBlock];
}

#pragma mark - UITextView
+ (UITextView *)textViewWithColor:(UIColor *)color delegate:(id)delegate {
    UITextView *textView = [[UITextView alloc] init];
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = color;
    textView.textAlignment = NSTextAlignmentLeft;
    textView.delegate = delegate;
    
    return textView;
}
 */

@end
