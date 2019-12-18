//
//  MYSortUtils.m
//  Algorithms
//
//  Created by 温明妍 on 2019/12/16.
//  Copyright © 2019 温明妍. All rights reserved.
//  排序的工具类

#import "MYSortUtils.h"

@implementation MYSortUtils

+ (NSArray<NSNumber *> *)insertionSortingWithArray:(NSArray<NSNumber *> *)unsortArray {
    NSTimeInterval startTime = [NSDate date].timeIntervalSince1970;
    if (!unsortArray || !unsortArray.count) {
        return nil;
    }
    NSInteger unsortNumber;
    NSMutableArray *result = [NSMutableArray arrayWithArray:unsortArray];

    for (int i = 1; i < result.count; i++) {
        unsortNumber = [[result objectAtIndex:i] integerValue];
        for (int j = 0; j < i; j++) {
            NSInteger sortedNumber = [[result objectAtIndex:j] integerValue];
            if (unsortNumber < sortedNumber) {
                [result removeObjectAtIndex:i];
                [result insertObject:@(unsortNumber) atIndex:j];
                break;
            }
        }
//        NSLog(@"current result: %@",result);
    }
    NSTimeInterval endTime = [NSDate date].timeIntervalSince1970;
    
    NSLog(@"diffTime = %f",endTime - startTime);
    return result;
}

@end
