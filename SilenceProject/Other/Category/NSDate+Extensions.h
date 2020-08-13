//
//  NSDate+Extensions.h
//  Cosmetic
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017年 eli. All rights reserved.
//

#import <Foundation/Foundation.h>

// Time
#define T_MINUTE 60
#define T_HOUR   (60 * T_MINUTE)
#define T_DAY    (24 * T_HOUR)
#define T_5_DAYS (5 * T_DAY)
#define T_WEEK   (7 * T_DAY)
#define T_MONTH  (30.5 * T_DAY)
#define T_YEAR   (365 * T_DAY)

@interface NSDate (Extensions)

//判断是否是今年
- (BOOL)isThisYear;

//判断是否是今天
- (BOOL)isThisToday;

//判断是否是昨天
- (BOOL)isThisYesterday;

//与现在的时间间隔
- (NSDateComponents *)datalWithNow;

/**
 *  date相差当前8小时
 */
+ (NSDate *)dateFromSystemDate:(NSDate *)date;


/**
 *  字符串转NSDate
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 */
+ (NSDate *)dateFromString:(NSString *)timeStr
                    format:(NSString *)format;

/**
 *  NSDate转时间戳
 *
 *  @param date 字符串时间
 *
 *  @return 返回时间戳
 */
+ (NSInteger)cTimestampFromDate:(NSDate *)date;

/**
 *  字符串转时间戳
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回时间戳的字符串
 */
+(NSInteger)cTimestampFromString:(NSString *)timeStr
                          format:(NSString *)format;


/**
 *  时间戳转字符串
 *
 *  @param timeStamp 时间戳
 *  @param format    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)dateStrFromCstampTime:(NSInteger)timeStamp
                     withDateFormat:(NSString *)format;

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate时间
 *  @param format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format;

@end
