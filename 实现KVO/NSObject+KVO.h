//
//  NSObject+KVO.h
//  实现KVO
//
//  Created by Rainse on 2017/7/26.
//  Copyright © 2017年 Rainse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)


// 监听某对象属性
- (void)ys_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
