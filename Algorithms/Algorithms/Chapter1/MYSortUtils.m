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

+ (NSArray<NSNumber *> *)selectionSortingWithArray:(NSArray<NSNumber *> *)unsortArray {
    NSTimeInterval startTime = [NSDate date].timeIntervalSince1970;
    if (!unsortArray || !unsortArray.count) {
        return nil;
    }
    // 找出最小的数
    NSMutableArray *result = [NSMutableArray arrayWithArray:unsortArray];
    for (int j = 0; j < unsortArray.count; j++) {
        int minIndex = j;
        int minNumber = [[result objectAtIndex:j] intValue];
        for (int i = j+1; i < result.count; i++) {
            int unsortNumber = [[result objectAtIndex:i] intValue];
            if (unsortNumber < minNumber) {
                minNumber = unsortNumber;
                minIndex = i;
            }
        }
        
        if (minIndex != j) {
            result[minIndex] = result[j];
            result[j] = @(minNumber);
        } 
//        NSLog(@"current result: %@",result);
    }
    NSTimeInterval endTime = [NSDate date].timeIntervalSince1970;
    NSLog(@"diffTime = %f",endTime - startTime);
    return nil;
}

+ (NSArray<NSNumber *> *)mergeSortWithArray:(NSArray<NSNumber *> *)array1 andArray:(NSArray<NSNumber *> *)array2 {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:array1.count + array2.count];
    int i = 0,j = 0;
    while (i < array1.count && j < array2.count) {
        NSInteger num1 = [[array1 objectAtIndex:i] integerValue];
        NSInteger num2 = [[array2 objectAtIndex:j] integerValue];
        if (num1 <= num2) {
            [result addObject:@(num1)];
            i++;
        }
        if (num1 > num2) {
            [result addObject:@(num2)];
            j++;
        }
//        NSLog(@"result = %@",result);
    }
    
    if (i < array1.count) {
        for (; i < array1.count; i++) {
            [result addObject:array1[i]];
        }
    }
    
    if (j < array2.count) {
        for (; j < array2.count; j++) {
            [result addObject:array1[j]];
        }
    }
    return result;
}
+ (NSArray<NSNumber *> *)mergeSort1WithArray:(NSArray<NSNumber *> *)array {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:array.count];
    if (array.count == 1) {
        return array;
    }
    NSInteger middle = array.count / 2;
    NSArray *array1 = [array subarrayWithRange:NSMakeRange(0, middle)];
    NSArray *array2 = [array subarrayWithRange:NSMakeRange(middle, array.count - middle)];
    
    [result addObjectsFromArray:[self mergeSort1WithArray:array1 andArray:array2]];
    
    return result;
}
+ (NSArray<NSNumber *> *)mergeSort1WithArray:(NSArray<NSNumber *> *)array1
                                    andArray:(NSArray<NSNumber *> *)array2 {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:array2.count + array1.count];
    if (array1.count == 1 && array2.count == 1) {
        NSArray *array = [self mergeSort1WithNumber1:array1[0].integerValue andNum2:array2[0].integerValue];
        NSLog(@"result = %@",array);
        return array;
    } else if (array1.count + array2.count == 3) {
        NSArray *array = [self mergeSortWithArray:array1 andArray:array2];
        NSLog(@"result = %@",array);
        return array;
    } else {
        NSArray *lArray1 = [array1 subarrayWithRange:NSMakeRange(0, array1.count/2)];
        NSArray *lArray2 = [array1 subarrayWithRange:NSMakeRange(array1.count/2, array1.count - array1.count/2)];
        NSArray *result1 = [self mergeSort1WithArray:lArray1 andArray:lArray2];
        NSLog(@"result = %@",result1);
        NSArray *rArray1 = [array2 subarrayWithRange:NSMakeRange(0, array2.count/2)];
        NSArray *rArray2 = [array2 subarrayWithRange:NSMakeRange(array2.count/2, array2.count - array2.count/2)];
        NSArray *result2 = [self mergeSort1WithArray:rArray1 andArray:rArray2];
        NSLog(@"result = %@",result2);
        NSArray *subResult = [self mergeSort1WithArray:result1 andArray:result2];
        NSLog(@"result = %@",subResult);
        [result addObjectsFromArray:subResult];
    }
    return result;
}

+ (NSArray *)mergeSort1WithNumber1:(NSInteger)num1 andNum2:(NSInteger)num2 {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:2];
    if (num2 < num1) {
        [result addObject:@(num1)];
        [result addObject:@(num2)];
    } else {
        [result addObject:@(num2)];
        [result addObject:@(num1)];
    }
    return result;
}


@end
