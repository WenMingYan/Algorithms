//
//  MYSortUtils.h
//  Algorithms
//
//  Created by 温明妍 on 2019/12/16.
//  Copyright © 2019 温明妍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYSortUtils : NSObject


/// 插入排序，从小到大
/// @param unsortArray 未排序的array
+ (NSArray<NSNumber *> *)insertionSortingWithArray:(NSArray<NSNumber *> *)unsortArray;

/// 选择算法
/// @param unsortArray 未排序array
+ (NSArray<NSNumber *> *)selectionSortingWithArray:(NSArray<NSNumber *> *)unsortArray;


/// 归并排序
/// 将两个已排好序的数组，合并为一个排好序的数组
/// @param array1 数组1
/// @param array2 数组2
+ (NSArray<NSNumber *> *)mergeSortWithArray:(NSArray<NSNumber *> *)array1
                                   andArray:(NSArray<NSNumber *> *)array2;


/// 归并排序 分治法 递归调用
/// @param array 数组
+ (NSArray<NSNumber *> *)mergeSort1WithArray:(NSArray<NSNumber *> *)array;
                                    

@end

NS_ASSUME_NONNULL_END
