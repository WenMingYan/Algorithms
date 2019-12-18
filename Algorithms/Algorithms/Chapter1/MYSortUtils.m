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
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:unsortArray.count];
    
    // 先加入第0个数
    [result addObject:unsortArray[0]];
    
    for (int i = 1; i < unsortArray.count; i++) {
        unsortNumber = [[unsortArray objectAtIndex:i] integerValue];
        NSArray *middle = result.copy;
        for (int j = 0; j < middle.count; j++) {
            NSInteger sortNumber = [[result objectAtIndex:j] integerValue];
            if (unsortNumber < sortNumber) {
                [result insertObject:[NSNumber numberWithInteger:unsortNumber] atIndex:j];
                break;
            }
        }
        if (middle.count == result.count) {
            [result addObject:[NSNumber numberWithInteger:unsortNumber]];
        }
        
        NSLog(@"current result: %@",result);
        
    }
    
    NSTimeInterval endTime = [NSDate date].timeIntervalSince1970;
    
    NSLog(@"diffTime = %f",endTime - startTime);
    NSLog(@"复杂度：O(n) = n^2");
    return result;
}

@end
