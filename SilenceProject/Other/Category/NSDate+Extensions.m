//
//  NSDate+Extensions.m
//  Cosmetic
//
//  Created by Mstic on 2017/3/13.
//  Copyright © 2017年 eli. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

static NSDateFormatter *dateFormatter;

- (BOOL)isThisYear
{
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //获取调用者日期年份
    NSDateComponents *createCmp = [calendar components:NSCalendarUnitYear fromDate:self];
    //拿着发帖的时间与当前时间对比
    //获取当前时间
    NSDate *curDate = [NSDate date];
    
    //获取当前日期的年份
    NSDateComponents *curCmp = [calendar components:NSCalendarUnitYear fromDate:curDate];
    
    return createCmp.year == curCmp.year;
}

- (BOOL)isThisToday
{
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInToday:self];
}

- (BOOL)isThisYesterday
{
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInYesterday:self];
}

- (NSDateComponents *)datalWithNow
{
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
}


+ (NSDate *)dateFromSystemDate:(NSDate *)date {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}

+ (NSDateFormatter *)defaultFormatter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc]init];
    });
    return dateFormatter;
}

+ (NSDate *)dateFromString:(NSString *)timeStr
                    format:(NSString *)format {
    NSDateFormatter *dateFormatter = [NSDate defaultFormatter];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:timeStr];
    return date;
}

+ (NSInteger)cTimestampFromDate:(NSDate *)date {
    return (long)[date timeIntervalSince1970];
}


+(NSInteger)cTimestampFromString:(NSString *)timeStr
                          format:(NSString *)format {
    NSDate *date = [NSDate dateFromString:timeStr format:format];
    return [NSDate cTimestampFromDate:date];
}

+ (NSString *)dateStrFromCstampTime:(NSInteger)timeStamp
                     withDateFormat:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [NSDate datestrFromDate:date withDateFormat:format];
}

+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format {
    NSDateFormatter* dateFormat = [NSDate defaultFormatter];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}


@end
