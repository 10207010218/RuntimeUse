//
//  WHookUtility.h
//  无缝埋点统计
//
//  Created by 汪宁 on 2016/12/2.
//  Copyright © 2016年 汪宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHookUtility : NSObject

+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end
