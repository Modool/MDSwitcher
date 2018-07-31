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
#define MDSTuple(ITEM, ...)    [MDSwitcherTuple tupleWithObjects:ITEM, __VA_ARGS__, nil]

/// Switcher to bind target's property with items,
/// item selection applied by MDSwitcherAbility which managing index.
@interface MDSwitcher<__covariant ObjectType> : NSObject

/// Items: block like 'id (^)(void)' or instance of NSObject
@property (nonatomic, copy, readonly) NSArray<ObjectType> *items;

/// Access first object of items
@property (nonatomic, strong, readonly) ObjectType first;

/// Access second object of items
@property (nonatomic, strong, readonly) ObjectType second;

/// Access third object of items
@property (nonatomic, strong, readonly) ObjectType third;

/// Access fourth object of items
@property (nonatomic, strong, readonly) ObjectType fourth;

/**
 Initialization

 @param target Target object reference
 @param property perperty name of target
 @param item first object
 @return MDSwitcher instance
 */
+ (instancetype)switcherWithTarget:(id)target property:(NSString *)property item:(ObjectType)item, ...;
- (instancetype)initWithTarget:(id)target property:(NSString *)property item:(ObjectType)item, ...;

/**
 Initialization

 @param target Target object reference
 @param property perperty name of target
 @param items object array
 @return MDSwitcher instance
 */
+ (instancetype)switcherWithTarget:(id)target property:(NSString *)property items:(NSArray<ObjectType> *)items;
- (instancetype)initWithTarget:(id)target property:(NSString *)property items:(NSArray<ObjectType> *)items NS_DESIGNATED_INITIALIZER;

@end

/// Class for trampoline assignment using subscript key
@interface MDSwitcherAssignmentTrampoline : NSObject

/**
 Initialization

 @param target Target object reference
 @return MDSwitcherAssignmentTrampoline instance
 */
- (instancetype)initWithTarget:(id)target;

/**
 Accessing property setter with keyed subscript

 @param object object of MDSwitcher or MDSwitcherTuple or NSArray
 @param keyPath keyPath of property
 */
- (void)setObject:(id)object forKeyedSubscript:(NSString *)keyPath;

@end

/**
 Tuple to collect objects
 */
@interface MDSwitcherTuple<__covariant ObjectType> : NSObject

/// All object of tuple
@property (nonatomic, strong, readonly) NSArray<ObjectType> *objects;

/**
 Initialization

 @param object an object instance
 @return MDSwitcherTuple instance
 */
+ (instancetype)tupleWithObject:(ObjectType)object;
- (instancetype)initWithObject:(ObjectType)object;

/**
 Initialization

 @param object first object
 @return MDSwitcherTuple instance
 */
+ (instancetype)tupleWithObjects:(ObjectType)object, ...;
- (instancetype)initWithObjects:(ObjectType)object, ...;

/**
 Initialization

 @param array object array
 @return MDSwitcherTuple instance
 */
- (instancetype)initWithArray:(NSArray<ObjectType> *)array;

@end

