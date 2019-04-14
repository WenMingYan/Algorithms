//
//  main.m
//  Algorithms
//
//  Created by 明妍 on 2019/4/11.
//  Copyright © 2019 明妍. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "MYLinkNode.h"
#import "MYInsertionSort.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:[NSNumber numberWithInt:3]];
        [array addObject:[NSNumber numberWithInt:2]];
        [array addObject:[NSNumber numberWithInt:8]];
        [array addObject:[NSNumber numberWithInt:5]];
        [array addObject:[NSNumber numberWithInt:4]];
        [array addObject:[NSNumber numberWithInt:1]];
        [array addObject:[NSNumber numberWithInt:7]];
        [array addObject:[NSNumber numberWithInt:6]];
        NSArray *result = [MYInsertionSort insertionSortWithArray:array];
        NSLog(@"InsertionSort result is :\n %@",result);
        
    }
    return 0;
}
