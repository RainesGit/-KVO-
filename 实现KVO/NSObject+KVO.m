//
//  NSObject+KVO.m
//  实现KVO
//
//  Created by Rainse on 2017/7/26.
//  Copyright © 2017年 Rainse. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "SonPerson.h"
NSString *const yskey = @"observer";

@implementation NSObject (KVO)


- (void)ys_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
{
    
    
    objc_setAssociatedObject(self, (__bridge const void *)(yskey), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 修改对象isa 指针
    object_setClass(self, [SonPerson class]);
}
@end
