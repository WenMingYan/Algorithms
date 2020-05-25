//
//  MYMergeListNode.h
//  Algorithms
//
//  Created by WenMingYan on 2020/5/2.
//  Copyright © 2020 温明妍. All rights reserved.
//  合并两个有序链表
// 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
// 示例：
// 输入：1->2->4, 1->3->4
// 输出：1->1->2->3->4->4
// 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYListNode : NSObject

@property (nonatomic, strong) NSString *val;
@property (nonatomic, strong) MYListNode *next;

@end

@interface MYMergeListNode : NSObject

+ (MYListNode *)mergeTwoListNode:(MYListNode *)l1 withAnother:(MYListNode *)l2;

@end

NS_ASSUME_NONNULL_END
