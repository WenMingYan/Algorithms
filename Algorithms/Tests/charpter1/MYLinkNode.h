//
//  MYLinkNode.h
//  Algorithms
//
//  Created by 明妍 on 2019/4/11.
//  Copyright © 2019 明妍. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MYLinkNode : NSObject

@property (nonatomic, assign) NSInteger number; /**< 值  */
@property (nonatomic, strong) MYLinkNode *nextNode;// 下一个
@property(nonatomic, weak) MYLinkNode *preNode;/**< 上一个  */

+ (instancetype)arrayToLineNode:(NSArray<NSNumber *> *)array;
- (NSArray *)array;

@end
