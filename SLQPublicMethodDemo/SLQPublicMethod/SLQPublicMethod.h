///
//  SLQPublicMethod
//  
//
//  Created by MrSong on 16/8/26.
//  Copyright © 2016年 Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLQPublicMethod : NSObject
///正则匹配验证手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
///正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
///正则匹配车牌号 按标准的粤A12345，1中文，1字母，再5位字母数字
+ (BOOL)checkCarNumber:(NSString *)carNumber;
///正则匹配姓名 至少两个汉字
+ (BOOL)checkName:(NSString *)name;
///正则匹配数字
+ (BOOL)checkNumber: (NSString *)number;

/**
 *  正则匹配地址，中文、字母或数字组成
 *
 *  @param address addres
 *
 *  @return bool
 */
+ (BOOL)checkAddress:(NSString *)address;


/**
 *  获取设备版本
 *
 *  @return e.g. iPhone 5S
 */
+ (NSString*)deviceVersion;


//获取UUID
+ (NSString*)uuid;

/// 是否是数字字符串
+ (BOOL)isPureNumandCharacters:(NSString *)string;
/**
 *  获取当前时间
 *
 *  @return
 */
+ (NSString *)getCurrentDate;

/**
 *  获取指定时间的日期(YYYY-MM-dd)
 *
 *  @param date 需要转换的日期
 *
 *  @return 转换为(YYYY-MM-dd)格式的时间字符串
 */
+ (NSString *)getDesignateStrFromDate:(NSDate *)date;

/**
 *  返回以逗号分隔的字符串
 *
 *  @param photoNames 要处理的字符串
 *
 *  @return 结果
 */
+ (NSString* )operatorPhotos:(NSString *)photoNames;
/**
 *  获取报错信息
 *
 *  @param error error description
 *
 *  @return
 */
+ (NSString *)getErrorMessage:(NSError *)error;
@end
