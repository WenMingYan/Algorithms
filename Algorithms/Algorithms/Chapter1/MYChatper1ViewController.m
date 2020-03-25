//
//  MYChatper1ViewController.m
//  Algorithms
//
//  Created by 温明妍 on 2019/12/16.
//  Copyright © 2019 温明妍. All rights reserved.
//  第一章的vc

#import "MYChatper1ViewController.h"
#import <Masonry/Masonry.h>
#import "MYSortUtils.h"

@implementation MYChatper1ViewController

- (void)invokeWithTitle:(NSString *)title value:(NSString *)vcString {
    if ([self respondsToSelector:NSSelectorFromString(vcString)]) {
        [self performSelector:NSSelectorFromString(vcString)];
    }
}

- (void)insertionSort {
    NSArray *array = @[@5,@2,@4,@6,@1,@3];
    NSArray *result = [MYSortUtils insertionSortingWithArray:array];
    NSLog(@"result = %@",result);
}

- (void)selectionSort {
    NSArray *array = @[@5,@2,@4,@6,@1,@3];
    NSLog(@"array = %@",array);
    NSArray *result = [MYSortUtils selectionSortingWithArray:array];
    NSLog(@"result = %@",result);
}

- (void)mergeSort {
    NSArray *array1 = @[@2,@4,@5,@7];
    NSArray *array2 = @[@1,@2,@3,@6];
    NSArray *result = [MYSortUtils mergeSortWithArray:array1 andArray:array2];
    NSLog(@"result = %@",result);
}

- (void)mergeSortWithRecursion {
    NSArray *array = @[@5,@2,@4,@7,@1,@3,@2,@6];
    NSArray *result = [MYSortUtils mergeSort1WithArray:array];
    NSLog(@"result = %@",result);
}

- (NSDictionary<NSString *,NSString *> *)nameDict {
    return @{
        @"insertion Sort":@"insertionSort",
        @"selection Sort":@"selectionSort",
        @"merge Sort":@"mergeSort",
        @"merge Sort with Recursion":@"mergeSortWithRecursion",
    };
}

- (NSArray<NSString *> *)names {
    return @[
        @"insertion Sort",
        @"selection Sort",
        @"merge Sort",
        @"merge Sort with Recursion"
    ];
}

@end
