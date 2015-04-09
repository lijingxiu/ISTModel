//
//  NSString+Util.h
//  UsedCar
//
//  Created by Alan on 13-11-8.
//  Copyright (c) 2013年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

+ (NSString *)openUDID;
- (NSString *)md5;
- (NSString *)encrypt3DES;
- (NSString *)decrypt3DES;
- (NSString *)encodeURL;
- (NSString *)trim;
- (NSString *)dNull;
- (NSString *)IMAccount;
- (NSString *)IMPassword;
/* 防止显示（null） */
- (NSString *)dNull:(NSString *)replace;
- (int)lengthUnicode;
- (NSString *)omitForSize:(CGSize)size font:(UIFont *)font;

/* 3DES加密 */
- (NSString *)encrypt3DES:(NSString *)gkey iv:(NSString *)iv;
/* 3DES解密 */
- (NSString *)decrypt3DES:(NSString *)gkey iv:(NSString *)iv;

/*日期字符串截取*/
- (NSString *)cutTimeZone;
- (NSString *)cutTimeZoneSpace;
- (NSString *)dateWithTime;

/*是否包含中文*/
- (BOOL)isChinese;

+ (NSString *)decodeUTF8ToChinese:(NSString *)encodeStr;
+ (NSString *)encodeChineseToUTF8:(NSString *)encodeStr;

@end

@interface NSString (JSON)
+ (id)convertJsonToObject:(NSString *)jsonString;
+ (NSString *)convertObjectToJson:(id)object;
@end

@interface NSString(NSDate)
/*----返回日期格式如：12月25日/星期四----*/
+(NSString *)getDateString:(NSString *)dateString;
//返回指定格式的当前时间字符串
+(NSString *)timeStamp;
+(NSString *)nowDateFmtStr:(NSString *)fmt;
+(NSString *)dateFmtStr:(NSString *)fmt date:(NSDate *)date;

@end
