//
//  UserManager.h
//  FlameDemo
//
//  Created by WN on 2017/5/19.
//  Copyright © 2017年 WN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *aliasName;
@property (nonatomic, copy) NSString *updateInfo;
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *simpleLoginGesture;
@property (nonatomic, copy) NSString *mobileNo;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *flag;
@property (nonatomic, copy) NSString *errorTimes;
@property (nonatomic, copy) NSString *openAccount;
@property (nonatomic, copy) NSString *simpleLoginFingure;
@property (nonatomic, copy) NSString *rnid;
@property (nonatomic, copy) NSData *imageData;
@property (nonatomic, copy) NSString * riskAssessment;//风险测评等级

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end


@interface UserManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign) NSInteger gotoIndex;
@property(nonatomic, assign) BOOL status;
@property (nonatomic, copy) NSString *name;
@property(nonatomic, assign) int errorNum;


+ (void)saveRemSwitch:(BOOL)isopen;
+ (BOOL)getRemSwitch;
+ (void)saveRemUserName:(NSString *)name;
+ (void)saveRemAlisNameName:(NSString *)alisName;
+ (NSString *)getRemUserName;


+ (NSString *)getRemUserNum;
+ (void)saveRemUserNum:(NSString *)num;

+ (NSString *)getUserID;
+ (void)saveUserID:(NSString *)userID;

+ (NSString *)getUuID;
+ (void)saveUuID:(NSString *)uuID;

+ (NSString *)getgestureLogiSwitch;
+ (void)saveGestureSwitch:(NSString *)switchIsOn;

+ (NSInteger)getgesErrortimes;
+ (void)saveGestureerrortimes:(NSInteger)errortimes;

//定位信息
+ (NSString *)getgeslocationGPS;
+ (void)savelocationGPS:(NSString *)locationGPS;


+ (NSString *)getRiskEvaluation;
+ (void)saveRiskEvaluation:(NSString *)RiskEvaluation;


//+ (NSString *)getFingerLogiSwitch;
//+ (void)saveFingerSwitch:(NSString *)switchIsOn;

+ (UserModel *)getUserModel;
+ (void)saveUserModel:(UserModel *)userModel;

+ (BOOL)getTouchId;
+ (void)saveTouchID:(BOOL)touchId;


@end
