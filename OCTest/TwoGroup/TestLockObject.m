//
//  TestLockObject.m
//  OCTest
//
//  Created by xulianpeng on 2019/1/10.
//  Copyright © 2019 lianpeng. All rights reserved.
//

#import "TestLockObject.h"

@implementation TestLockObject
- (void)method1{
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    NSLog(@"Current thread = %@", [NSThread currentThread]);
    
    NSLog(@"Main thread = %@", [NSThread mainThread]);
    
}



- (void)method2{
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    NSLog(@"Current thread = %@", [NSThread currentThread]);
    
    NSLog(@"Main thread = %@", [NSThread mainThread]);
    
    
    
}
@end
