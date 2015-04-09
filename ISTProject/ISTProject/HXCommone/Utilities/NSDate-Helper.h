//
//  NSDate-Helper.h
//  ViewImage
//
//  Created by QQ on 10-8-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDate (Helpers)

- (NSString *)getFormatYearMonthDay;
- (int )getWeekNumOfMonth;
- (int )getWeekOfYear;
- (NSDate *)dateAfterDay:(int)day;    //几天后的时间
- (NSDate *)dateafterMonth:(int)month;//几月后的时间， 几月前的时间则传入month为 负数即可
- (NSUInteger)getDay;
- (NSUInteger)getMonth;
- (NSUInteger)getYear;
- (int )getHour;
- (int )getMinute;
- (int )getHour:(NSDate *)date;
- (int )getMinute:(NSDate *)date;
- (NSUInteger)daysAgo;           // 计算间隔多少天
- (NSUInteger)daysAgoWithDate: (NSDate *)date;

- (NSUInteger)daysAgoAgainstMidnight;
- (NSString *)stringDaysAgo;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
- (NSUInteger)weekday;
- (NSString *)weekdayWithPrefixString:(NSString *)preStr;

+ (NSDate *)dateFromString:(NSString *)string;
//////   [NSDate dateFromString:@"2011-5-12" withFormat:@"yyyy-M-dd"];
/////	NSDate *adate = [NSDate dateFromString:@"2011年5月12日" withFormat:@"yyyy年M月dd日"];
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;

- (NSString *)string;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfMonth;
- (NSDate *)endOfMonth;
- (NSDate *)beginningOfDay;
- (NSDate *)endOfWeek;

+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;

/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/
+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate;

//根据秒数显示时间
+(NSString *)getTimeStrWithTimeInterval:(NSTimeInterval)time;
//根据播放音乐时间
+(NSString *)getMusicTimeStrWithTimeInterval:(NSTimeInterval)time;

//获得显示的时间
+ (NSString *)getShowTimeWithTimeStamp:(long long int)receivetime;



@end