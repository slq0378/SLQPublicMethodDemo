//
//  SLQPublicMethod
//  
//
//  Created by MrSong on 16/8/26.
//  Copyright © 2016年 Christian. All rights reserved.
//

#import "SLQPublicMethod.h"
#import "sys/utsname.h"
#import <CoreText/CoreText.h>

@implementation SLQPublicMethod
//正则匹配验证手机号 11个数字
+ (BOOL)checkTelNumber:(NSString *) telNumber {
    //    NSString *pattern = @"\\d{11}$";
    NSString *pattern = @"^[0-9]{11}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
    //    //  错误
    //    NSError *error = nil;
    //    //  正则表达式
    //    NSRegularExpression *rge = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    //    //  如果创建出错直接返回
    //    NSAssert(error == nil,@"正则表达式创建失败:%@",error);
    //    //  通过正则表达式匹配字符
    //    NSTextCheckingResult *rs = [rge firstMatchInString:telNumber options:0 range:NSMakeRange(0, telNumber.length)];
    //    return rs;
}
//正则匹配用户身份证号 15位或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|[xX])$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

//正则匹配车牌号 按标准的粤A12345，1中文，1字母，再5位字母数字
+ (BOOL)checkCarNumber:(NSString *)carNumber{
    NSString *pattern = @"[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:carNumber];
    return isMatch;
}

//正则匹配姓名 至少两个汉字
+ (BOOL)checkName:(NSString *)name{
    NSString *pattern = @"^([\u4e00-\u9fa5]{2,20})$";
    NSString *nameStr = [name stringByReplacingOccurrencesOfString:@"·" withString:@""];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:nameStr];
    return isMatch;
}
//正则匹配数字
+ (BOOL)checkNumber:(NSString *)number {
   NSString *pattern = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
}

/**
 *  中文、字母或数字组成
 *
 *  @param address addres
 *
 *  @return bool
 */
+ (BOOL)checkAddress:(NSString *)address {
//    NSString *ss = @"姝姩鐢讳负鍦涓婃樉绀烘枃瀛鍒楀嚭鎴戝湪椤圭洰涓";
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5\\-]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if(![pred evaluateWithObject: address])
    {
        return false;
        ////此动画为弹出buttonqww
//        NHAlertView *alertView = [[NHAlertView alloc]initWithTitle:@"提示" message:@"昵称只能由中文、字母或数字组成" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//        [alertView show];
        
        
        /*
         //此动画为在顶上显示文字
         [MPNotificationView notifyWithText:@"昵称只能由中文、字母或数字组成"
         andDuration:0.5];
         */
    }else {
        return true;
    }
}

/**
 *  设备版本
 *
 *  @return e.g. iPhone 5S
 */
+ (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return deviceString;
}

+ (NSString*)uuid
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    
    return [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

+ (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

+ (NSString *)getCurrentDate {
    // 设置当前时间
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSDate *currentDate = [NSDate date];
    NSString *createTime = [dateformatter stringFromDate:currentDate];
    return createTime;
}

+ (NSString *)getDesignateStrFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

// 处理字符串，以逗号分隔
+ (NSString* )operatorPhotos:(NSString *)photoNames {
    //
    NSArray *housePhotouuidArr = nil;
    NSMutableString *mutablePhotos = [NSMutableString string];
    if([photoNames rangeOfString:@","].location != NSNotFound){
        housePhotouuidArr = [photoNames componentsSeparatedByString:@","];
    }else {
        housePhotouuidArr = [photoNames componentsSeparatedByString:@" "];
    }
    
    for (NSString *hosuePhotouuid in housePhotouuidArr) {
        if (![hosuePhotouuid isEqualToString:@""]){
            NSString *photoId = [hosuePhotouuid stringByReplacingOccurrencesOfString:@" " withString:@""];
            photoId = [photoId stringByReplacingOccurrencesOfString:@"," withString:@""];
            mutablePhotos = [NSMutableString stringWithString:[mutablePhotos stringByAppendingString:[NSString stringWithFormat:@"%@,",photoId]]];
        }
    }
    if([mutablePhotos hasSuffix:@","]){
        return [mutablePhotos stringByReplacingCharactersInRange:NSMakeRange(mutablePhotos.length - 1, 1) withString:@""];
    }else {
        return mutablePhotos;
    }
}

+ (NSString *)getErrorMessage:(NSError *)error {
    NSString *result;
    if(error.code == -1001) {
        result = @"请求超时，请检查网络";
    }else if(error.code == -1004) {
        result = @"无网络连接，请检查网络";
    }else if(error.code == 3840) {
        result = @"JSON解析错误！";
    }else if(error.code == -1016) {
        result = @"JSON解析错误！";
    }else {
        result = [error localizedDescription];
    }
    return result;
}
@end
