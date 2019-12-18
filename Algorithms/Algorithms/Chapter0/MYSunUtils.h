//
//  MYSunUtils.h
//  Algorithms
//
//  Created by 温明妍 on 2019/12/18.
//  Copyright © 2019 温明妍. All rights reserved.
//  计算当天日出日落时间

#import <Foundation/Foundation.h>

@interface MYSunUtils : NSObject


/// 日出时间
/// @param longitude 经度
/// @param latitude 维度
+ (NSDate *)sunRaiseTimeWithLongitude:(double)longitude andLatitude:(double)latitude;


/// 日落时间
/// @param longitude 经度
/// @param latitude 维度
+ (NSDate *)sunSetTimeWithLongitude:(double)longitude andLatitude:(double)latitude;

@end
