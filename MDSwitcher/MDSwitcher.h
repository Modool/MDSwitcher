//
//  MDSwitcher.h
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MDSwitcherRefer(TARGET, PROPERTY, ITEM, ...)    [MDSwitcher switcherWithTarget:TARGET property:(((void)(NO && ((void)TARGET.PROPERTY, NO)), @#PROPERTY)) item:ITEM, __VA_ARGS__, nil]

@interface MDSwitcher<__covariant ObjectType> : NSObject

@property (nonatomic, copy, readonly) NSArray<ObjectType> *items;

@property (nonatomic, strong, readonly) ObjectType first;
@property (nonatomic, strong, readonly) ObjectType second;
@property (nonatomic, strong, readonly) ObjectType third;
@property (nonatomic, strong, readonly) ObjectType fourth;

+ (instancetype)switcherWithTarget:(id)target property:(NSString *)property item:(ObjectType)item, ...;
- (instancetype)initWithTarget:(id)target property:(NSString *)property item:(ObjectType)item, ...;

+ (instancetype)switcherWithTarget:(id)target property:(NSString *)property items:(NSArray<ObjectType> *)items;
- (instancetype)initWithTarget:(id)target property:(NSString *)property items:(NSArray<ObjectType> *)items NS_DESIGNATED_INITIALIZER;

@end
