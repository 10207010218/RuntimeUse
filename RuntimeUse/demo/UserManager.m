//
//  UserManager.m
//  FlameDemo
//
//  Created by WN on 2017/5/19.
//  Copyright © 2017年 WN All rights reserved.
//

#import "UserManager.h"
#import <objc/runtime.h>
static UserManager* sharedInstance = nil;
@implementation UserManager



+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[UserManager alloc] init];
    });
    return sharedInstance;
}


+ (void)saveRemSwitch:(BOOL)isopen
{
    [[NSUserDefaults standardUserDefaults] setObject:@(isopen) forKey:@"RemSwitch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)getRemSwitch
{
    NSNumber *sw = [[NSUserDefaults standardUserDefaults] objectForKey:@"RemSwitch"];
//    if (!sw) {
//        sw = @(1);
//
//    }
    BOOL isopen = [sw boolValue];
    return isopen;
}

+ (NSString *)getRemUserNum
{
    NSString *sw = [[NSUserDefaults standardUserDefaults] objectForKey:@"RemUserNum"];
    return sw;
}


+ (void)saveRemUserNum:(NSString *)num

{
    
    [[NSUserDefaults standardUserDefaults] setObject:num forKey:@"RemUserNum"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSString *)getRemUserName
{
    NSString *sw = [[NSUserDefaults standardUserDefaults] objectForKey:@"RemUser"];
    return sw;
}


+ (void)saveRemUserName:(NSString *)name

{
    
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"RemUser"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)saveRemAlisNameName:(NSString *)alisName {
    
    [[NSUserDefaults standardUserDefaults] setObject:alisName forKey:@"aliasName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSString *)getUserID
{
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"userID"];
    return userID;
}


+ (void)saveUserID:(NSString *)userID

{
    
    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"userID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getUuID{
    NSString *uuID = [[NSUserDefaults standardUserDefaults] objectForKey:@"uuID"];
    if (!uuID) {
        uuID = @"";
    }
    return uuID;
}
+ (void)saveUuID:(NSString *)uuID{
    if (uuID) {
        [[NSUserDefaults standardUserDefaults] setObject:uuID forKey:@"uuID"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


+ (NSString *)getgestureLogiSwitch{
    NSString *switchIsOn = [[NSUserDefaults standardUserDefaults] objectForKey:@"switch"];
    return switchIsOn;
}
+ (void)saveGestureSwitch:(NSString *)switchIsOn{
    
    [[NSUserDefaults standardUserDefaults] setObject:switchIsOn forKey:@"switch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (NSInteger)getgesErrortimes{
    
    NSInteger  errortimes = [[NSUserDefaults standardUserDefaults] integerForKey:@"errortimes"];
    return errortimes;
}
+ (void)saveGestureerrortimes:(NSInteger)errortimes{
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:errortimes forKey:@"errortimes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


//定位信息
+ (NSString *)getgeslocationGPS{
    NSString *locationGPS = [[NSUserDefaults standardUserDefaults] objectForKey:@"locationGPS"];
    return locationGPS;
    
}
+ (void)savelocationGPS:(NSString *)locationGPS{
    
    [[NSUserDefaults standardUserDefaults] setObject:locationGPS forKey:@"locationGPS"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




+ (NSString *)getRiskEvaluation{
    NSString *riskEvaluation = [[NSUserDefaults standardUserDefaults] objectForKey:@"riskEvaluation"];
    if (!riskEvaluation) {
        riskEvaluation = @"马上评估";
    }
    return riskEvaluation;
    
}
+ (void)saveRiskEvaluation:(NSString *)riskEvaluation{
    
    [[NSUserDefaults standardUserDefaults] setObject:riskEvaluation forKey:@"riskEvaluation"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


+ (UserModel *)getUserModel {
    
    NSData * date =[[NSUserDefaults standardUserDefaults]objectForKey:@"BCUserModel"];
    
    UserModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:date];
  
    return model;
    
}
+ (void)saveUserModel:(UserModel *)userModel{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userModel];
    if (data) {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"BCUserModel"];
    }
}

+ (BOOL)getTouchId{
    
    
    NSString * switchIsOn = [[NSUserDefaults standardUserDefaults] objectForKey:@"TouchIdOpen"];
    
    if (switchIsOn && [switchIsOn isEqualToString:@"1"]) {
        return YES;
    }
    return NO;
    
}
+ (void)saveTouchID:(BOOL)touchId{
    NSString *status = @"";
    if (touchId) {
        status = @"1";
    }else{
       status = @"0";
    }
    [[NSUserDefaults standardUserDefaults] setObject:status forKey:@"TouchIdOpen"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

@implementation UserModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        NSMutableDictionary *resultDic = [self filterDic:dict];
        [self setValuesForKeysWithDictionary:resultDic];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    
    unsigned int count = 0;
    Ivar *ivarLists = class_copyIvarList([UserModel class], &count);// 注意下面分析
    for (int i = 0; i < count; i++) {
        const char* name = ivar_getName(ivarLists[i]);
        NSString* strName = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
    free(ivarLists);
    
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self)
    {

        unsigned int count = 0;
        
        Ivar *ivarLists = class_copyIvarList([UserModel class], &count);
        for (int i = 0; i < count; i++) {
            const char* name = ivar_getName(ivarLists[i]);
            NSString* strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [aDecoder decodeObjectForKey:strName];
            [self setValue:value forKey:strName];
        }
        free(ivarLists);
        
    }
    return self;
}


- (NSMutableDictionary *)filterDic:(NSDictionary *)dic {
    NSMutableDictionary * resultDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    for (NSString *key in resultDic.allKeys) {
        if (![resultDic objectForKey:key]) {
            [resultDic setValue:@"" forKey:key];
        }
    }
    return resultDic;
}



@end

