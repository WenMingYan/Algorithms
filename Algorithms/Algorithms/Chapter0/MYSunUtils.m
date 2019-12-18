//
//  MYSunUtils.m
//  Algorithms
//
//  Created by 温明妍 on 2019/12/18.
//  Copyright © 2019 温明妍. All rights reserved.
//

#import "MYSunUtils.h"

@implementation MYSunUtils


/// 白天时长
/// @param longitude 经度
/// @param latitude 维度
+ (long)dayTimeWithLongitude:(double)longitude andLatitude:(double)latitude {
    
    
    
    return 0;
}


/// 正午时间
/// @param longitude 经度
/// @param latitude 维度
+ (NSTimeInterval)noonTimeWithLongitude:(double)longitude andLatitude:(double)latitude {
    NSInteger timeZone = longitude / 15;// 算出时区
    NSInteger timeDiff = (longitude - timeZone * 15) * 1 / 15.f;// 与时区中心差的时间
    NSTimeInterval noonTime = 12 + timeDiff;
    return noonTime;
}


+ (NSDate *)sunRaiseTimeWithLongitude:(double)longitude andLatitude:(double)latitude {
    if (longitude < 0 || longitude > 360) {
        //经度不正确
        return nil;
    }
    NSTimeInterval noonTime = [self noonTimeWithLongitude:longitude andLatitude:latitude];
    
    
    
    return nil;
}

+ (NSDate *)sunSetTimeWithLongitude:(double)longitude andLatitude:(double)latitude {
    return nil;
}

@end
