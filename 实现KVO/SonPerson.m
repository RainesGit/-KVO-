

//
//  SonPerson.m
//  实现KVO
//
//  Created by Rainse on 2017/7/26.
//  Copyright © 2017年 Rainse. All rights reserved.
//

#import "SonPerson.h"

#import <objc/runtime.h>
extern NSString *const yskey;

@implementation SonPerson


- (void)setName:(NSString *)name
{
    
    [super setName:name];
    
   id observer = objc_getAssociatedObject(self, yskey);
    
    [observer observeValueForKeyPath:@"name" ofObject:self change:nil context:nil];
}
@end
