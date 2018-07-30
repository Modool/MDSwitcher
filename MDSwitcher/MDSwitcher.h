//
//  MDSwitcher.h
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MD_SWITCHER_PROPERTY(TARGET, PROPERTY)   (((void)(NO && ((void)TARGET.PROPERTY, NO)), #PROPERTY))
#define MDS(TARGET, PROPERTY)  [[MDSwitcherAssignmentTrampoline alloc] initWithTarget:(TARGET)][@MD_SWITCHER_PROPERTY(TARGET, PROPERTY)]

@interface MDSwitcherAssignmentTrampoline : NSObject

- (instancetype)initWithTarget:(id)target;
- (void)setObject:(NSArray *)items forKeyedSubscript:(NSString *)keyPath;

@end
