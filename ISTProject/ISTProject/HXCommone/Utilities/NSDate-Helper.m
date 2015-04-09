//
//  NSDate-Helper.m
//  ViewImage
//
//  Created by QQ on 10-8-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSDate-Helper.h"

@implementation NSDate(Helpers)

/*
 * This guy can be a little unreliable and produce unexpected results,
 * you're better off using daysAgoAgainstMidnight
 */

- (NSString *)getFormatYearMonthDay
{
	NSString *string;
	if ([self getMonth] < 10 && [self getDay] < 10) {
		string = [NSString stringWithFormat:@"%d-0%d-0%d",[self getYear],[self getMonth],[self getDay]];
	}
	else if ([self getMonth] < 10 && [self getDay] >= 10)
	{
		string = [NSString stringWithFormat:@"%d-0%d-%d",[self getYear],[self getMonth],[self getDay]];
	}
	else if ([self getMonth] >= 10 && [self getDay] >= 10)
	{
		string = [NSString stringWithFormat:@"%d-%d-%d",[self getYear],[self getMonth],[self getDay]];
	}
	else {
		string = [NSString stringWithFormat:@"%d-%d-0%d",[self getYear],[self getMonth],[self getDay]];
		
	}
	return string;
}

- (int )getWeekNumOfMonth
{
	return [[self endOfMonth] getWeekOfYear] - [[self beginningOfMonth] getWeekOfYear] + 1;
}

- (int )getWeekOfYear
{
	int i;
	int year = [self getYear];
	NSDate *date = [self endOfWeek];
	for (i = 1;[[date dateAfterDay:-7 * i] getYear] == year;i++) 
	{
	}
	return i;
}


- (NSDate *)dateAfterDay:(int)day
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	//	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:day];
	NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	return dateAfterDay;
}
//- (void)printDate
//{
//	int day = 1;
//	NSCalendar *calendar = [NSCalendar currentCalendar];
//	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
//	[componentsToAdd setDay:day];
//	NSDate *currentDate = [NSDate date];
//	for (int day = 1; day < 7; day ++) {
//		<#statements#>
//	}
//	NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
//}
- (NSDate *)dateafterMonth:(int)month
{	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	//	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setMonth:month];
	NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	return dateAfterMonth;
}

- (NSUInteger)getDay{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:self];
	return [dayComponents day];
}
- (NSUInteger)getMonth
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:self];
	return [dayComponents month];
}
- (NSUInteger)getYear
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:self];
	return [dayComponents year];
}
- (int )getHour {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	NSInteger hour = [components hour];
	return (int)hour;
}
- (int)getMinute {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	NSInteger minute = [components minute];
	return (int)minute;
}
- (int )getHour:(NSDate *)date {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:date];
	NSInteger hour = [components hour];
	return (int)hour;
}
- (int)getMinute:(NSDate *)date {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:date];
	NSInteger minute = [components minute];
	return (int)minute;
}

- (NSUInteger)daysAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSDayCalendarUnit) 
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components day];
}

- (NSUInteger)daysAgoWithDate: (NSDate *)date
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSDayCalendarUnit) 
											   fromDate:self
												 toDate:date
												options:0];
	return [components day];
}
- (NSUInteger)daysAgoAgainstMidnight {
	// get a midnight version of ourself:
	NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
	[mdf setDateFormat:@"yyyy-MM-dd"];
	NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];
	
	return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}

- (NSString *)stringDaysAgo {
	return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag {
	NSUInteger daysAgo = (flag) ? [self daysAgoAgainstMidnight] : [self daysAgo];
	NSString *text = nil;
	switch (daysAgo) {
		case 0:
			text = @"Today";
			break;
		case 1:
			text = @"Yesterday";
			break;
		default:
			text = [NSString stringWithFormat:@"%d days ago", daysAgo];
	}
	return text;
}

- (NSUInteger)weekday {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *weekdayComponents = [calendar components:(NSWeekdayCalendarUnit) fromDate:self];
	return [weekdayComponents weekday];
}


- (NSString *)weekdayWithPrefixString:(NSString *)preStr {
    NSInteger week = [self weekday];
    NSString *weekdayStr = nil;
    switch (week) {
        case 1:
            weekdayStr = [NSString stringWithFormat:@"%@日",preStr];
            break;
        case 2:
            weekdayStr = [NSString stringWithFormat:@"%@一",preStr];
            break;
        case 3:
            weekdayStr = [NSString stringWithFormat:@"%@二",preStr];
            break;
        case 4:
            weekdayStr = [NSString stringWithFormat:@"%@三",preStr];
            break;
        case 5:
            weekdayStr = [NSString stringWithFormat:@"%@四",preStr];
            break;
        case 6:
            weekdayStr = [NSString stringWithFormat:@"%@五",preStr];
            break;
        case 7:
            weekdayStr = [NSString stringWithFormat:@"%@六",preStr];
            break;

        default:
            break;
    }
    return weekdayStr;
}
 
+ (NSDate *)dateFromString:(NSString *)string {
	return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
	NSDate *date = [inputFormatter dateFromString:string];
	
	return date;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
	return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date {
	return [date string];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed {
	/* 
	 * if the date is in today, display 12-hour time with meridian,
	 * if it is within the last 7 days, display weekday name (Friday)
	 * if within the calendar year, display as Jan 23
	 * else display as Nov 11, 2008
	 */
	
	NSDate *today = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *offsetComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) 
													 fromDate:today];
	
	NSDate *midnight = [calendar dateFromComponents:offsetComponents];
	
	NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];
	NSString *displayString = nil;
	
	// comparing against midnight
	if ([date compare:midnight] == NSOrderedDescending) {
		if (prefixed) {
			[displayFormatter setDateFormat:@"'at' h:mm a"]; // at 11:30 am
		} else {
			[displayFormatter setDateFormat:@"h:mm a"]; // 11:30 am
		}
	} else {
		// check if date is within last 7 days
		NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
		[componentsToSubtract setDay:-7];
		NSDate *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
		if ([date compare:lastweek] == NSOrderedDescending) {
			[displayFormatter setDateFormat:@"EEEE"]; // Tuesday
		} else {
			// check if same calendar year
			NSInteger thisYear = [offsetComponents year];
			
			NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) 
														   fromDate:date];
			NSInteger thatYear = [dateComponents year];			
			if (thatYear >= thisYear) {
				[displayFormatter setDateFormat:@"MMM d"];
			} else {
				[displayFormatter setDateFormat:@"MMM d, yyyy"];
			}
		}
		if (prefixed) {
			NSString *dateFormat = [displayFormatter dateFormat];
			NSString *prefix = @"'on' ";
			[displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
		}
	}
	
	// use display formatter to return formatted date string
	displayString = [displayFormatter stringFromDate:date];
	return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date {
	return [self stringForDisplayFromDate:date prefixed:NO];
}

- (NSString *)stringWithFormat:(NSString *)format {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:format];
	NSString *timestamp_str = [outputFormatter stringFromDate:self];
	return timestamp_str;
}

- (NSString *)string {
	return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateStyle:dateStyle];
	[outputFormatter setTimeStyle:timeStyle];
	NSString *outputString = [outputFormatter stringFromDate:self];
	return outputString;
}
//返回周日的的开始时间
- (NSDate *)beginningOfWeek {
	// largely borrowed from "Date and Time Programming Guide for Cocoa"
	// we'll use the default calendar and hope for the best
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDate *beginningOfWeek = nil;
	BOOL ok = [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek
						   interval:NULL forDate:self];
	if (ok) {
		return beginningOfWeek;
	} 
	
	// couldn't calc via range, so try to grab Sunday, assuming gregorian style
	// Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	
	/*
	 Create a date components to represent the number of days to subtract from the current date.
	 The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
	 */
	NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
	[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
	beginningOfWeek = nil;
	beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
	
	//normalize to midnight, extract the year, month, and day components and create a new date from those components.
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
											   fromDate:beginningOfWeek];
	return [calendar dateFromComponents:components];
}
//返回当前天的年月日.
- (NSDate *)beginningOfDay {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) 
											   fromDate:self];
	return [calendar dateFromComponents:components];
}
- (NSDate *)beginningOfMonth
{
	return [self dateAfterDay:-[self getDay] + 1];
}
- (NSDate *)endOfMonth
{
	return [[[self beginningOfMonth] dateafterMonth:1] dateAfterDay:-1];
}
//返回当前周的周末
- (NSDate *)endOfWeek {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:(7 - [weekdayComponents weekday])];
	NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	return endOfWeek;
}

+ (NSString *)dateFormatString {
	return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString {
	return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
	return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString {	
	return [NSDate timestampFormatString];
}


+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=[self todayZeroZero]){   //// 在两天内的
            
            dateStr=[self PMorAM:needFormatDate];
        }else if(time<=([self todayZeroZero]+60*60*24))
        {
            dateStr=@"昨天";
        }else if(time<=60*60*24*7)
        {
            dateStr=[needFormatDate weekdayWithPrefixString:@"星期"];
        }
        else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}
//获取在距当天00点的间隔秒
+(NSTimeInterval)todayZeroZero
{
    NSDate *now=[NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:now];
	NSInteger minute = [components minute];
    NSInteger hour=[components hour];
    return hour*60*60+minute*60;
}
+(NSString *)PMorAM:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSHourCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    return components.hour<12?@"上午":@"下午";
}

+(NSString *)getTimeStrWithTimeInterval:(NSTimeInterval)time
{
    NSString *string = [NSString stringWithFormat:@"%01li:%02li",
                        lround(floor(time / 60.)) % 60,
                        lround(floor(time)) % 60];
    return string;
}

+(NSString *)getMusicTimeStrWithTimeInterval:(NSTimeInterval)time
{
    NSString *string = [NSString stringWithFormat:@"%02li:%02li",
                        lround(floor(time / 60.)) % 60,
                        lround(floor(time)) % 60];
    return string;
}

+ (NSString *)getShowTimeWithTimeStamp:(long long int)receivetime
{
    @try {
        
        NSDate *needFormatDate = [NSDate dateWithTimeIntervalSince1970:receivetime/1000];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSDate * nowDate = [NSDate date];
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if(time<=[self todayZeroZero]){   //// 在两天内的
            
            dateStr=[self PMorAM:needFormatDate];
            
        }else if(time<=([self todayZeroZero]+60*60*24))
        {
            dateStr=@"昨天";
        }else if(time<=60*60*24*7)
        {
            dateStr=[needFormatDate weekdayWithPrefixString:@"星期"];
        }
        else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM-dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
}


@end