//
//  UIViewController+userStatics.m
//  无缝埋点统计
//
//  Created by 汪宁 on 2016/12/2.
//  Copyright © 2016年 汪宁. All rights reserved.
//

#import "UIViewController+userStatics.h"
#import "WHookUtility.h"
@implementation UIViewController (userStatics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swiz_viewWillAppear:);
        [WHookUtility swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
    });
}
#pragma mark - Method Swizzling
- (void)swiz_viewWillAppear:(BOOL)animated
{
    //插入需要执行的代码
    NSLog(@"我在viewWillAppear执行前偷偷插入了一段代码%@",[self class]);
    
    //不能干扰原来的代码流程，插入代码结束后要让本来该执行的代码继续执行
    [self swiz_viewWillAppear:animated];
}

//对于不同的页面有不同的PageID。我们可以用 if，else。或者配置一个plist文件写上所有的页面
/*
(NSString *)pageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WGlobalUserStatisticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

*/
@end
