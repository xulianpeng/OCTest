//
//  XLPUIMake.h
//
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@class HDFNavigationView;

//
// 默认导航返回按钮图片，如果需要修改，请在此处修改
//
//#define kDefaultNavImageName @"ios-left-btn"
//#define kDefaultNavHightlightedImageName @"ios-left-btn"

/**
 *  @author xulianpeng
 *
 *  组件工厂类
 *
 *  @since 0.1
 */
@interface XLPUIMake : NSObject

#pragma mark - UIButton相关
////////////////////////////////////////////////////////////////
// @name UIButton控件生成相关API
//
// touchUp ：touchUpInside事件回调block
// touchDown：touchDown事件回调block
//
// @note 所有按钮都有设计规范指定的圆角
////////////////////////////////////////////////////////////////

#pragma mark -- 蓝色按钮相关
/**
 *  @author xulianpeng
 *
 *  UIButton 基类初始化方式，未添加约束
 *
 *  @param title     标题
 *  @param color     标题颜色
 *  @param font     字体
 *  @param backColor  背景颜色
 *  @param cornerRadius 角度
 *  @param superView 父视图
 *  @param touchDown   回调
 *
 *  @return UIButton对象
 */
+ (UIButton *)xlpInitWithTitle:(NSString*)title titleColor:(UIColor *)color font:(UIFont *)font backColor:(UIColor *)backColor corner:(CGFloat)cornerRadius superView:(UIView *)superView touchDown:(XLPButtonBlock)touchDown;
/**
 *  @author xulianpeng
 *
 *  Button 图片按钮
 *  @param imageName     图片
 *  @param cornerRadius 角度
 *  @param superView   父视图
 *  @param touchDown  点击回调
 *
 *  @return UIButton对象
 */
+ (UIButton *)xlpInitWithImage:(NSString*)imageName  corner:(CGFloat)cornerRadius superView:(UIView *)superView touchDown:(XLPButtonBlock)touchDown;

/**
 button 2张图片切换

 @param imageName image
 @param highlighedImageName highImage
 @param cornerRadius 角度
 @param superView 父试图
 @param touchDown 点击回调
 @return button
 */
+ (UIButton *)xlpInitWithNormalImage:(NSString *)imageName
                    highlightedImage:(NSString *)highlighedImageName
                              corner:(CGFloat)cornerRadius
                           superView:(UIView *)superView
                           touchDown:(XLPButtonBlock)touchDown;

#pragma mark - 底部工具栏组件相关
////////////////////////////////////////////////////////////////
// @name 底部工具栏某个组件生成相关API
// @note 需要传superView，内部已经完成约束的添加，外部不需要再添加约束
////////////////////////////////////////////////////////////////

/**
 *  @author xulianpeng
 *
 *  通用的底部工具条组件，灰色按钮样式，左右、中间相距10px，整个组件放在superView的底部，
 *  与superView等宽，高度固定49px,已添加好约束
 *
 *  @param superView  必传
 *  @param leftTitle  左侧按钮标题
 *  @param rightTitle 右侧按钮标题
 *  @param touchLeft  左侧按钮点击回调
 *  @param touchRight 右侧按钮点击架设
 *
 *  @return 工具条组件
 *
 */
+ (UIView *)bottomToolbarWithSuperView:(UIView *)superView
                             leftTitle:(NSString *)leftTitle
                            rightTitle:(NSString *)rightTitle
                             TouchLeft:(XLPButtonBlock)touchLeft
                            touchRight:(XLPButtonBlock)touchRight;

#pragma mark - UILabel组件相关
////////////////////////////////////////////////////////////////
// @name UILabel控件生成相关API
////////////////////////////////////////////////////////////////
#pragma mark -- 分割线相关
#pragma mark --- 水平线
/**
 *  @author xulianpeng
 *
 *  生成分割线
 *
 *  @param leftPadding 与父视图左边的距离
 *  @param top         与父视图顶部的距离
 *  @param superView   父视图
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding
                             top:(CGFloat)top
                          toView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成分割线
 *
 *  @param leftPadding 与父视图左边的距离
 *  @param top         与父视图顶部的距离
 *  @param superView   父视图
 *  @param color       线的颜色
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding
                             top:(CGFloat)top
                          toView:(UIView *)superView
                           color:(UIColor *)color;

/**
 *  @author xulianpeng
 *
 *  生成分割线,与父视图等宽
 *
 *  @param top         与父视图顶部的距离
 *  @param superView   父视图
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithTop:(CGFloat)top toView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成分割线
 *
 *  @param leftPadding 与父视图左边的距离
 *  @param bottom      与父视图底部的距离
 *  @param superView   父视图
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding
                          bottom:(CGFloat)bottom
                          toView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成分割线，与父视图左、右边缘相距都为0
 *
 *  @param bottom      与父视图底部的距离
 *  @param superView   父视图
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithBottom:(CGFloat)bottom toView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成分割线
 *
 *  @param leftPadding 与父视图左边的距离
 *  @param bottom      与父视图底部的距离
 *  @param superView   父视图
 *  @param color       分割线的颜色
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithLeftPadding:(CGFloat)leftPadding
                          bottom:(CGFloat)bottom
                          toView:(UIView *)superView
                           color:(UIColor *)color;
#pragma mark --- 竖线
/**
 *  @author xulianpeng
 *
 *  生成分割线
 *
 *  @param topPadding  与父视图顶部的距离
 *  @param leftPadding 与父视图左边的距离
 *  @param bottom      与父视图底部的距离
 *  @param superView   父视图
 *  @param color       分割线的颜色
 *
 *  @return UILabel对象
 */
+ (UILabel *)lineWithTopPadding:(CGFloat)topPadding
                    leftPadding:(CGFloat)leftPadding
                          bottom:(CGFloat)bottom
                          toView:(UIView *)superView
                           color:(UIColor *)color;

#pragma mark -- 生成UILabel相关
/**
 *  @author xulianpeng
 *
 *  生成左对齐、14px（正文大小，不加租）、透明背景、numberOfLines=0的label
 *
 *  @param text 文本
 *
 *  @return UILabel对象
 */
+ (UILabel *)labelWithText:(NSString *)text;

/**
 *  @author xulianpeng
 *
 *  生成Label对象，这个API是通用API，如果没有便捷的API可以使用，就调用此API生成
 *
 *  @param text            文本
 *  @param align           对齐方式
 *  @param fontSize        字体大小
 *  @param isBold          是否是加粗
 *  @param textColor       文本颜色
 *  @param backgroundColor 背景颜色
 *
 *  @return UILabel对象
 */
+ (UILabel *)labelWithText:(NSString *)text
                     align:(NSTextAlignment)align
                  fontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold
                 textColor:(UIColor *)textColor
           backgroundColor:(UIColor *)backgroundColor;

/**
 *  @author xulianpeng
 *
 *  生成Label对象，背景色为透明
 *
 *  @param text            文本
 *  @param align           对齐方式
 *  @param fontSize        字体大小
 *  @param isBold          是否是加粗
 *  @param textColor       文本颜色
 *
 *  @return UILabel对象
 */
+ (UILabel *)labelWithText:(NSString *)text
                     align:(NSTextAlignment)align
                  fontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold
                 textColor:(UIColor *)textColor;

/**
 *  @author xulianpeng
 *
 *  生成Label对象，背景色为透明，文本颜色为白色
 *
 *  @param text            文本
 *  @param align           对齐方式
 *  @param fontSize        字体大小
 *  @param isBold          是否是加粗
 *
 *  @return UILabel对象
 */
+ (UILabel *)labelWithText:(NSString *)text
                     align:(NSTextAlignment)align
                  fontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold;


/**
 *  @author xulianpeng
 *
 *  生成导航条所使用的label，内部已经按照标准设计规范配置好属性值
 *
 *  @param text 标题
 *
 *  @note 只能在导航中使用
 *
 *  @return UILabel对象
 */
+ (UILabel *)navLabelWithText:(NSString *)text;

#pragma mark - 导航条API相关
/////////////////////////////////////////////////////////////////////
// @name 导航条控件生成相关API
//
// @note 如果下面的API不能满足需求，请自行使用HDFNavigationView的方法创建使用，
//       其使用方法与系统的UINavigationItem类似。
//
// @see  HDFNavigationView
/////////////////////////////////////////////////////////////////////
#pragma mark -- 带返回按钮导航API
/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock;
/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightTitle        右侧按钮标题
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                         rightTitle:(NSString *)rightTitle
                         rightBlock:(XLPButtonBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightImage        可以是图片对象，也可以是图片名称
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                         rightImage:(NSString *)rightImage
                         rightBlock:(XLPButtonBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightImage        可以是图片对象，也可以是图片名称
 *  @param highlightedImage  可以是图片对象，也可以是图片名称
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                         rightImage:(NSString *)rightImage
                   highlightedImage:(NSString *)highlightedImage
                         rightBlock:(XLPButtonBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightTitles       右侧标题数组
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightTitles:(NSArray *)rightTitles
                         rightBlock:(XLPButtonIndexBlock)rightBlock;
/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightImages       可以为图片对象数组，也可以为图片名称数组
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightImages:(NSArray *)rightImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，带默认返回按钮
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightImages       可以为图片对象数组，也可以为图片名称数组
 *  @param highlightedImages 可以为高亮图片对象数组，也可以为高亮图片名称数组
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightImages:(NSArray *)rightImages
                  highlightedImages:(NSArray *)highlightedImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，可指定返回按钮图片，如果不传，则使用默认返回图片
 *
 *  @param title         导航标题
 *  @param superView     必传，作为导航的父视图
 *  @param leftImage     如果为nil，则使用默认返回图片
 *  @param leftHighImage 如果为nil，则使用默认返回高亮图片
 *  @param leftBlock     可为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftImage:(NSString *)leftImage
                      leftHighImage:(NSString *)leftHighImage
                          leftBlock:(XLPButtonBlock)leftBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定title，可指定返回按钮图片，如果不传，则使用默认返回图片
 *
 *  @param title             导航标题
 *  @param superView         必传，作为导航的父视图
 *  @param leftImage         如果为nil，则使用默认返回图片
 *  @param leftHighImage     如果为nil，则使用默认返回高亮图片
 *  @param leftBlock         可为nil，表示不处理
 *  @param rightImages       可以为图片对象数组，也可以为图片名称数组
 *  @param highlightedImages 可以为高亮图片对象数组，也可以为高亮图片名称数组
 *  @param rightBlock        如果为nil，表示不处理
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                          leftImage:(NSString *)leftImage
                      leftHighImage:(NSString *)leftHighImage
                          leftBlock:(XLPButtonBlock)leftBlock
                        rightImages:(NSArray *)rightImages
                  highlightedImages:(NSArray *)highlightedImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定titleView，带默认返回按钮，无右侧按钮组
 *
 *  @param titleView   外部创建的视图，作为导航的titleView
 *  @param superView   必传，作为导航的父视图
 *  @param leftBlock   可为nil,表示不处理，但是依然显示默认返回按钮
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定titleView，带默认返回按钮，可指定右侧按钮组
 *
 *  @param titleView   外部创建的视图，作为导航的titleView
 *  @param superView   必传，作为导航的父视图
 *  @param leftBlock   可为nil,表示不处理，但是依然显示默认返回按钮
 *  @param rightTitles 右侧标题名称数组
 *  @param rightBlock  当rightTitles不为nil时，才此作用
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock
                            rightTitles:(NSArray *)rightTitles
                             rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定titleView，带默认返回按钮，可指定右侧按钮组
 *
 *  @param titleView   外部创建的视图，作为导航的titleView
 *  @param superView   必传，作为导航的父视图
 *  @param leftBlock   可为nil,表示不处理，但是依然显示默认返回按钮
 *  @param rightImages 可以为图片对象数组，也可以为图片名称数组
 *  @param rightBlock  当rightImages不为nil时，才此作用
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock
                            rightImages:(NSArray *)rightImages
                             rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，指定titleView，带默认返回按钮，可指定右侧按钮组
 *
 *  @param titleView       外部创建的视图，作为导航的titleView
 *  @param superView       必传，作为导航的父视图
 *  @param leftBlock       可为nil,表示不处理，但是依然显示默认返回按钮
 *  @param rightImages     可以为图片对象数组，也可以为图片名称数组
 *  @param rightHighImages 右侧高亮图片数组，可为图片对象，也可以为图片名称数组
 *  @param rightBlock      当rightImages不为nil时，才此作用
 *
 *  @return 导航组件
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                              leftBlock:(XLPButtonBlock)leftBlock
                            rightImages:(NSArray *)rightImages
                        rightHighImages:(NSArray *)rightHighImages
                             rightBlock:(XLPButtonIndexBlock)rightBlock;

#pragma mark -- 无返回按钮的导航
//--------------------------------------------------------------------------//
// 下面的4个导航工厂API，都是没有左侧返回按钮的
//--------------------------------------------------------------------------//
/**
 *  @author xulianpeng
 *
 *  生成导航组件，可指定titleView，无默认返回按钮，如果不需要显示左侧按钮组，可以传nil
 *
 *  @param titleView   外部创建好的视图，作为导航的titleView
 *  @param superView   必须传过来，否则约束无效
 *  @param leftTitles  左侧按钮标题组，可为nil，表示不需要
 *  @param leftBlock   可以leftTitles不为nil,此参数此作用，反之，无效
 *  @param rightTitles 右侧按钮标题组，可为nil，表示不需要
 *  @param rightBlock  可以rightTitles不为nil,此参数此作用，反之，无效
 *
 *  @return 导航组件对象
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                             leftTitles:(NSArray *)leftTitles
                              leftBlock:(XLPButtonIndexBlock)leftBlock
                            rightTitles:(NSArray *)rightTitles
                             rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，可指定titleView，无默认返回按钮
 *
 *  @param titleView   外部创建好的视图，作为导航的titleView
 *  @param superView   必须传过来，否则约束无效
 *  @param rightTitles 右侧按钮标题组，可为nil，表示不需要
 *  @param rightBlock  可以rightTitles不为nil,此参数此作用，反之，无效
 *
 *  @return 导航组件对象
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView
                            rightTitles:(NSArray *)rightTitles
                             rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，无默认返回按钮
 *
 *  @param title       作为导航的titleView的文本
 *  @param superView   必须传过来，否则约束无效
 *  @param rightTitles 右侧按钮标题组，可为nil，表示不需要
 *  @param rightBlock  可以rightTitles不为nil,此参数此作用，反之，无效
 *
 *  @return 导航组件对象
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        rightTitles:(NSArray *)rightTitles
                         rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，无默认返回按钮，右侧按钮组是图片组
 *
 *  @param title       导航标题名称
 *  @param superView   必须传，作为导航的父视图
 *  @param rightImages 图片名称数组或者图片对象数组
 *  @param rightBlock  如果rightImages不为nil，此参数有效
 *
 *  @note rightImages可以全部是main bundle中的图片名称，也可以全部是UIImage对象，但是不能混合
 *
 *  @return 导航组件对象
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        rightImages:(NSArray *)rightImages
                         rightBlock:(XLPButtonIndexBlock)rightBlock;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，无默认返回按钮，亦无右侧按钮组
 *
 *  @param title     导航标题
 *  @param superView 必须传，作为导航的父视图
 *
 *  @return 导航组件对象
 */
+ (HDFNavigationView *)navWithTitle:(NSString *)title
                          superView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成导航组件，无默认返回按钮，亦无右侧按钮组
 *
 *  @param titleView 外部创建好的视图，作为导航标题
 *  @param superView 必须传，作为导航的父视图
 *
 *  @return 导航组件对象
 */
+ (HDFNavigationView *)navWithTitleView:(UIView *)titleView
                              superView:(UIView *)superView;


#pragma mark - 开关控件（UISwitch）
/**
 *  @author xulianpeng
 *
 *  校准样式的开关组件
 *
 *  @param block 值发生改变时的回调
 *
 *  @return UISwitch对象
 */
+ (UISwitch *)switchWithChangedBlock:(XLPSwitchValueChangedBlock)block;

#pragma mark - ImageView控件
/**
 *  @author xulianpeng
 *
 *  图片控件生成，要求指定宽高，此API未添加约束，需要在外部手动添加。默认为矩形图片显示
 *
 *  @param size 图片的大小
 *
 *  @return UIImageView对象
 */
+ (UIImageView *)imageViewWithSize:(CGSize)size;

/**
 *  @author xulianpeng
 *
 *  图片控件生成，要求指定宽高，此API未添加约束，需要在外部手动添加。如果isCircle为YES,则会显示成圆形
 *
 *  @param size     图片大小
 *  @param isCircle 是否显示为圆
 *
 *  @return UIImageView对象
 */
+ (UIImageView *)imageViewWithSize:(CGSize)size isCircle:(BOOL)isCircle;

/**
 *  @author xulianpeng
 *
 *  图片控件生成,此API未添加约束，需要在外部手动添加，控件的大小会自动适应图片的大小。
 *
 *  @param imgName  图片名称
 *
 *  @return UIImageView对象
 */
+ (UIImageView *)imageViewWithImageName:(NSString *)imgName;

/**
 *  @author xulianpeng
 *
 *  图片控件生成,此API未添加约束，需要在外部手动添加，控件的大小会自动适应图片的大小。
 *
 *  @param image  图片对象
 *
 *  @return UIImageView对象
 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image;

/**
 *  @author xulianpeng
 *
 *  矩形图片控件生成,若superView不为nil，则会添加好约束，控件的大小会根据frame值而设置。
 *
 *  @param frame     用于指定图片控件在superView中的大小与位置
 *  @param superView 父视图
 *
 *  @return UIImageView对象
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame superView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  图片控件生成,若superView不为nil，则会添加好约束，控件的大小会根据frame值而设置。
 *  若isCircle为YES，则显示成圆形图片，否则显示为矩形图片
 *
 *  @param frame     用于指定图片控件在superView中的大小与位置
 *  @param superView 父视图
 *  @param isCircle  是否显示为圆
 *
 *  @return UIImageView对象
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame superView:(UIView *)superView isCircle:(BOOL)isCircle;

#pragma mark - UITableView控件
/**
 *  @author xulianpeng
 *
 *  生成UITableView表格控件，未添加约束，默认样式为plain
 *
 *  @param delegate 表格代理
 *
 *  @note delegate包含了dataSource和delegate
 *
 *  @return UITableView对象
 */
+ (UITableView *)tableViewWithDelegate:(id)delegate;

/**
 *  @author xulianpeng
 *
 *  生成UITableView表格控件，未添加约束
 *
 *  @param delegate 表格代理
 *  @param style    表格样式
 *
 *  @note delegate包含了dataSource和delegate
 *
 *  @return UITableView对象
 */
+ (UITableView *)tableViewWithDelegate:(id)delegate
                                 style:(UITableViewStyle)style;

/**
 *  @author xulianpeng
 *
 *  生成UITableView表格控件，若superView不为nil，则会添加好约束，默认样式为plain，占满supperView
 *
 *  @param delegate  表格代理
 *  @param superView 父视图
 *
 *  @note delegate包含了dataSource和delegate
 *
 *  @return UITableView对象
 */
+ (UITableView *)tableViewWithDelegate:(id)delegate
                             superView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成UITableView表格控件，若superView不为nil，则会添加好约束，自动占满整个superView
 *
 *  @param delegate  表格代理
 *  @param superView 父视图
 *  @param style    表格样式
 *
 *  @note delegate包含了dataSource和delegate
 *
 *  @return UITableView对象
 */
+ (UITableView *)tableViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 style:(UITableViewStyle)style;

/**
 *  @author xulianpeng
 *
 *  生成UITableView表格控件，若superView不为nil，则会添加好约束，与superView的边缘距离edges
 *
 *  @param delegate  表格代理
 *  @param superView 父视图
 *  @param style     表格样式
 *  @param edges     与父视图的边缘距离
 *
 *  @note delegate包含了dataSource和delegate
 *
 *  @return UITableView对象
 */
+ (UITableView *)tableViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 style:(UITableViewStyle)style
                                 edges:(UIEdgeInsets)edges;

#pragma mark - UIScrollView控件
/**
 *  @author xulianpeng
 *
 *  生成UIScrollView滚动视图对象，内部设置了默认属性值。此API未添加约束。
 *
 *  @param delegate 滚动视图代理
 *
 *  @return UIScrollView对象
 */
+ (UIScrollView *)scrollViewWithDelegate:(id)delegate;

/**
 *  @author xulianpeng
 *
 *  生成UIScrollView滚动视图对象，内部设置了默认属性值。
 *  若superView不为nil,则此API会添加好约束，且会占满superView
 *
 *  @param delegate  滚动视图代理
 *  @param superView 父视图
 *
 *  @return UIScrollView对象
 */
+ (UIScrollView *)scrollViewWithDelegate:(id)delegate
                               superView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  生成UIScrollView滚动视图对象，内部设置了默认属性值。
 *  若superView不为nil,则此API会添加好约束。
 *
 *  @param delegate  滚动视图代理
 *  @param superView 父视图
 *  @param edges     指定与superView边缘的距离
 *
 *  @return UIScrollView对象
 */
+ (UIScrollView *)scrollViewWithDelegate:(id)delegate
                               superView:(UIView *)superView
                                   edges:(UIEdgeInsets)edges;

#pragma mark - 网络请求失败界面组件
/**
 *  @author xulianpeng,2015-6-10
 *
 *  网络请求失败时，需要显示一个提示用户的界面，调用此API直接生成此界面，由于此界面是固定的，
 *  不管请求失败多少次，只需要创建一次，然后其他的调用失败，只需要做显示与隐藏操作
 *
 *  @param superView 添加约束需要，生成的view会自动与占满superView
 *  @param imgName    显示的图片的名称或者图片对象
 *  @param tip        请求失败的提示语
 *  @param callback   点击界面时的回调
 *
 *  @note  1、当点击时，会立刻回调callback，为了防止频繁的操作，在网络请求时，请隐藏此视图.
 *         2、如果superView为nil，那么生成的failureView不会添加约束，请在外部手动添加
 *
 *  @return 整个失败提示视图
 */
+ (UIView *)failureViewWithSuperView:(UIView *)superView
                               image:(id)image
                                 tip:(NSString *)tip
                            callback:(XLPGestureBlock)callback;

/**
 *  @author xulianpeng,2015-6-10
 *
 *  网络请求失败时，需要显示一个提示用户的界面，调用此API直接生成此界面，由于此界面是固定的，
 *  不管请求失败多少次，只需要创建一次，然后其他的调用失败，只需要做显示与隐藏操作
 *
 *  @param superView  添加约束需要，生成的view会自动与占满superView
 *  @param top        指定距离父视图顶部的距离
 *  @param image      显示的图片的名称或者图片对象
 *  @param tip        请求失败的提示语
 *  @param callback   点击界面时的回调
 *
 *  @note  1、当点击时，会立刻回调callback，为了防止频繁的操作，在网络请求时，请隐藏此视图.
 *         2、如果superView为nil，那么生成的failureView不会添加约束，请在外部手动添加
 *
 *  @return 整个失败提示视图
 */
+ (UIView *)failureViewWithSuperView:(UIView *)superView
                                 top:(CGFloat)top
                               image:(id)image
                                 tip:(NSString *)tip
                            callback:(XLPGestureBlock)callback;

#pragma mark - UIWebView相关API
/**
 *  @author xulianpeng
 *
 *  Webview控件生成，未添加约束，需要在外部手动添加
 *
 *  @param delegate 代理
 *
 *  @return UIWebView组件
 *
 */
+ (UIWebView *)webViewWithDelegate:(id)delegate;

/**
 *  @author xulianpeng
 *
 *  Webview控件生成，已添加好约束，占满superView
 *
 *  @param delegate  代理
 *  @param superView 作为webview的父视图，若为nil，则不会添加约束
 *
 *  @return UIWebView组件
 */
+ (UIWebView *)webViewWithDelegate:(id)delegate superView:(UIView *)superView;

/**
 *  @author xulianpeng
 *
 *  Webview控件生成，已添加好约束，若不需要占满，可指定与父视图的边缘
 *
 *  @param delegate  代理
 *  @param superView 作为webview的父视图，若为nil，则不会添加约束
 *  @param edges     指定与父视图的边缘距离
 *
 *  @return UIWebView组件
 */
+ (UIWebView *)webViewWithDelegate:(id)delegate superView:(UIView *)superView edges:(UIEdgeInsets)edges;

#pragma mark - UITextField
/**
 *  @author xulianpeng
 *
 *  生成UITextField控件
 *
 *  @param text             文本
 *  @param textColor        文本颜色
 *  @param placeholder      占位符文本
 *  @param placeholderColor 占位符文本颜色
 *  @param isSecurity       是否是显示*号
 *  @param delegate         代理
 *
 *  @return UITextField控件
 */
+ (UITextField *)textFieldWithText:(NSString *)text
                         textColor:(UIColor *)textColor
                       placeholder:(NSString *)placeholder
                  placeholderColor:(UIColor *)placeholderColor
                        isSecurity:(BOOL)isSecurity
                          delegate:(id)delegate;
/**
 *  @author xulianpeng
 *
 *  生成UITextField控件，默认secureTextEntry=NO，文本颜色为默认和占位符颜色为kG2Color
 *
 *  @param text             文本
 *  @param placeholder      占位符文本
 *  @param delegate         代理
 *
 *  @return UITextField控件
 */
+ (UITextField *)textFieldWithText:(NSString *)text
                       placeholder:(NSString *)placeholder
                          delegate:(id)delegate;

/**
 *  @author xulianpeng
 *
 *  生成UITextField控件，默认secureTextEntry=NO，文本颜色为默认和占位符颜色为kG2Color
 *
 *  @param text             文本
 *  @param placeholder      占位符文本
 *  @param delegate         代理
 *
 *  @return UITextField控件
 */
+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder
                          delegate:(id)delegate;

#pragma mark - UITextView
+ (UITextView *)textViewWithColor:(UIColor *)color delegate:(id)delegate;

@end
