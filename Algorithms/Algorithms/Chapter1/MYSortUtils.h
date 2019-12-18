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

@end

NS_ASSUME_NONNULL_END
