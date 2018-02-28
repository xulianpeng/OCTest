//
//  TestOneViewController.m
//  OCTest
//
//  Created by lianpeng on 2017/4/25.
//  Copyright © 2017年 lianpeng. All rights reserved.
//

#import "TestOneViewController.h"
#import "UITextView+XLPTextView.h"
@interface TestOneViewController ()<UITextViewDelegate>
@property(nonatomic,weak)NSTimer *timer;
@end

@implementation TestOneViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    UITextField *textfield = [UITextField xlp_textFieldWithPlaceholder:@"默认主window上的textfield" color:[UIColor redColor] font:14 superView:self.view constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(70);
        make.size.mas_equalTo(CGSizeMake(100, 30));

    }];
    
    UIButton * testButton =  [UIButton xlp_buttonWithTitle:@"window测试分支合并测试" superView:self.view constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    } touchDown:^(UIButton *sender) {
        
        
        
        UIWindow *twoWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight)];
        
        twoWindow.windowLevel = 200;
//        [twoWindow becomeKeyWindow];
//        [twoWindow makeKeyWindow];
        twoWindow.hidden = NO;
        [[UIApplication sharedApplication].delegate.window addSubview:twoWindow];
        UILabel *label = [UILabel xlp_labelWithText:@"我擦什么鬼啊" superView:twoWindow constraints:^(MASConstraintMaker *make) {
            make.top.and.left.mas_equalTo(200);
            make.size.mas_equalTo(CGSizeMake(100, 40));
        }];
        label.backgroundColor = [UIColor greenColor];
        
        NSLog(@"点击按钮了啊");
        
    }];
    
    testButton.backgroundColor = [XLPTool colorWith16RGB:0x309D9A];
    
 
    
    NSLog(@" ====啦啦啦啦 网址是否有效呢===%d",[XLPTool kIsUrl:@"https:// "]);
    
#pragma mark - 面试题1
    /*************************面试题开始*************************************/

    //面试题  label  上下切换 切换间隔是 2s
//    CGSize size = CGSizeMake(200, 40);

    UIView *labelView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
    [self.view addSubview:labelView];
    labelView.backgroundColor = [UIColor cyanColor];
    
//    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, labelView.frame.size.width, labelView.frame.size.height)];
//    [self.view addSubview:firstLabel];
//    firstLabel.text = @"我说123木头人我爱你";
//    
//    UILabel * twoLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 340, 200, 40)];
//    [self.view addSubview:twoLabel];
//    twoLabel.text = @"你说你爱了不该爱的人";
//    twoLabel.alpha = 0.0;
    
    
    UILabel *firstLabel = [UILabel xlp_labelWithText:[XLPTool randomCreatChinese:5] superView:self.view constraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(labelView.mas_centerX);
        make.top.mas_equalTo(labelView.mas_top);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
    }];
    
    UILabel *twoLabel = [UILabel xlp_labelWithText:@"你爱我我爱你啦啦啦啦啦我爱你" superView:self.view constraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labelView.mas_bottom);
        make.centerX.mas_equalTo(labelView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
    }];
    twoLabel.alpha = 0.0;
    
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:firstLabel];
    [arr addObject:twoLabel];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        UILabel *label1 = arr[0];
        UILabel *label2 = arr[1];
        [arr exchangeObjectAtIndex:0 withObjectAtIndex:1];
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [label1 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(labelView.mas_top).offset(-40);
            }];
            [self.view layoutIfNeeded];
            label1.alpha = 0.0;
        } completion:^(BOOL finished) {
            
            //这样写不是想要的结果
//            [label1 mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(labelView.mas_bottom);
//            }];
            
            [label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(labelView.mas_bottom);
                make.centerX.mas_equalTo(labelView.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(200, 40));
            }];
            [self.view layoutIfNeeded];

        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            label2.alpha = 1.0;
            label2.backgroundColor = [XLPTool colorRandom];
            [label2 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(labelView.mas_top);
            }];
            [self.view layoutIfNeeded];
        }];
        
        //第二种方法
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            label2.frame = CGRectMake(100, 300, 200, 40);
//            label2.alpha = 1.0;
//            
//        }];
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            label1.frame = CGRectMake(100, 260, 200, 40);
//            label1.alpha = 0.0;
//        } completion:^(BOOL finished) {
//            label1.frame = CGRectMake(100, 340, 200, 40);
//
//        }];
    }];
    /*************************面试题结束*************************************/
    
    /***********给textview添加预留字体属性验证****************/
    
    UITextView *aa = [[UITextView alloc]init];
    [self.view addSubview:aa];
    
    [aa mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelView.mas_bottom).offset(30);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(100);
    }];
    aa.layer.borderColor = [UIColor purpleColor].CGColor;
    aa.layer.borderWidth = 1;
    aa.font = kFontWithSize(13);
    aa.xlp_placeholder = @"请告诉我们您的宝贵建议,十分感谢你的反馈..分支2测试啦啦啦,分支4测试啦啦啦";
    aa.delegate = self;
    aa.returnKeyType = UIReturnKeyDone;
    
    //测试分支 与master 分支开叉 啦啦啦 在master分支上 提示测试代码
    
  
    //冒泡排序
//    [self maopaoSort];
    
    //快速排序
//    NSMutableArray *list =  [NSMutableArray arrayWithObjects:@"6",@"1",@"2",@"7",@"9",@"3",@"4",@"5",@"10",@"8", nil];
//    NSInteger low = 0;
//    NSInteger high = list.count - 1;
//    [self quickSort:list startIndex:low endIndex:high];
    
//    [self quickSortFromLeft:low toRight:high arr:list];
    
    //插入排序
    
    
    
//    NSLog(@"=====%@",list);
    
    //输出乘法口诀 9*9
    [self printChengfaKoujue];
    
    int a = 200;  //创建一个局部变量 a 并初始化为 200
//    __block int a = 200;
    void (^myTestBlock)(void) = ^(void){
        
        NSLog(@"======到底是什么鬼啊===%d",a);//输出1
    }; //创建一个 栈区 block
    a ++;
    NSLog(@"到底是什么鬼啊===%d",a);//输出2
    myTestBlock();  //调用前面创建的 block
    
    // 之前一直错误的认为 每次运行的结果是 输出2 输出1 输出1 把block回调和异步操作搞混了
    
//运行结果是  输出2 a = 201  输出1 a= 200 ->因为创建block时已经自动捕获变量a 而此时a=200
//运行结果是 __block修饰后  输出2 a = 201  输出1 a= 201
    
    
    
    dispatch_queue_t seriealQueue = dispatch_queue_create("seriealQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t currentQueue = dispatch_queue_create("currentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(seriealQueue, ^{
        
        NSLog(@"我是异步串行");
    }) ;
    dispatch_async(currentQueue, ^{
        
        NSLog(@"我是异步并行");
    }) ;
    
    dispatch_sync(seriealQueue, ^{
        NSLog(@"我是同步串行");

    });
    dispatch_sync(currentQueue, ^{
        NSLog(@"我是同步并行");
        
    });

    
}

- (void)maopaoSort{
    
    NSMutableArray *arr =  [NSMutableArray arrayWithObjects:@"9",@"4",@"5",@"3",@"2",@"7",@"8",@"1",@"0",@"6", nil];
    
    for (int i = 0; i < arr.count; i++) {
        
        for (int j = 0; j < arr.count - 1; j++) {
            
            if ([arr[j] intValue] > [arr[j + 1] intValue]) {
                
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j + 1]; //升序排列
                NSLog(@"最终的排列结果为%@",arr);

            }else{
                
                
                
            }
            
        }
        
    }
    
    NSLog(@"最终的排列结果为%@",arr);
}


-(void)quickSort:(NSMutableArray *)list startIndex:(NSInteger)start endIndex:(NSInteger)end
{
    
    if (start >= end) {
        return;
    }
    
    NSInteger low = start; //哨兵1
    NSInteger high = end; //哨兵2
    NSInteger key = [list[start]integerValue]; //关键值 key
    
    
    
    //从后往前  哨兵2  找到第一个比关键值 小的 数 哨兵2--
    
    //从前往后 哨兵1 找到第一个 比关键值大的 数 哨兵1++
    
    //若 哨兵1 < 哨兵2 两者交换  否则相遇 偶数 则 关键值 直接插入 哨兵1 2之间 , 单数 则分 大于关键值 则关键值放在该值前面  否则 关键值放在其后面 ,然后 数组 被 关键值 分为 2部分   关键值 前面是 数组1  ,后面为 数组2
    
    //然后 数组1 数组2  重复之前的操作
    
    
    while (low < high) {
        
        while ([list[high] integerValue] >= key &&  low < high && high > 0  ) {
            
            high--;
            
            NSLog(@"输出high===%ld",(long)high);
        }
        
        while ([list[low]integerValue] <= key && low < high) {
            low++;
            NSLog(@"输出high===%ld",(long)(low + 1));

        }
        
        if (low < high) {
            
            [list exchangeObjectAtIndex:low withObjectAtIndex:high];
            NSLog(@"======交换结果为\n %@",list);
        }
        
        
    }
    
    //基准数 与 high位置调换
    [list exchangeObjectAtIndex:start withObjectAtIndex:high];
    
    //数组 以基准数字 分为2部分 二分法
        
    [self quickSort:list startIndex:start endIndex:low-1]; //递归调用
    
    [self quickSort:list startIndex:low+1 endIndex:end]; //递归调用
    
    //重点理解递归调用的妙处 和 顺序执行的本质
    NSLog(@"啦啦啦啦");
    
    
}

- (void) quickSortFromLeft:(NSInteger)leftIndex toRight:(NSInteger)rightIndex  arr:(NSMutableArray *)listArr {
    
    if (leftIndex >= rightIndex) {
        return;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    NSInteger base = [listArr[leftIndex] integerValue];
    
    
    while (i != j) {
        while ([listArr[j] integerValue] >= base && i < j) {
            j --;
        }
        while ([listArr[i] integerValue] <= base && i < j) {
            i ++;
        }
        
        if (i < j) {
            NSInteger temp = [listArr[j] integerValue];
            listArr[j] = listArr[i];
            listArr[i] = [NSNumber numberWithInteger:temp];
            
        }
    }
    
    NSInteger temp = [listArr[j] integerValue];
    listArr[j] = [NSNumber numberWithInteger:base];
    listArr[leftIndex] = [NSNumber numberWithInteger:temp];
    
    
    [self quickSortFromLeft:leftIndex toRight:i-1 arr:listArr];
    [self quickSortFromLeft:i+1 toRight:rightIndex arr:listArr];
    
    
    
}

- (void)printChengfaKoujue{
    
    //输出乘法口诀
    
    for (int i = 1; i<= 9; i++) {
        
        for (int j = i; j<=9; j++) {
            
            NSLog(@"%d *  %d = %d \n",i,j,i * j);
        }
    }
    
    
}

- (NSString *)printStrWithNumber:(NSInteger)number{
    
    NSMutableString *str;
    
    for (NSInteger i = number; i > 0; i--) {
        
        NSString *theStr = [NSString stringWithFormat:@"%ld",i];
        
        [str appendString:theStr];
        
    }
    
    
    
    return str;
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
