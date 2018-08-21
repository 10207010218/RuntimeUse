//
//  UIViewController+useTest.m
//  RuntimeUse
//
//  Created by 汪宁 on 2018/8/21.
//  Copyright © 2018年 WN. All rights reserved.
//  用runtime特性 给类添加属性

#import "UIViewController+useTest.h"
#import <objc/runtime.h>

const char nameProperty ;

@implementation UIViewController (useTest)
@dynamic name;

- (void)setName:(NSString *)name{
    
    objc_setAssociatedObject(self, &nameProperty, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)getName{
    
    return objc_getAssociatedObject(self, &nameProperty);
}


@end
