//
//  MDSwitcher.h
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDSwitcher<__covariant ObjectType> : NSObject

@property (nonatomic, copy, readonly) NSArray<ObjectType> *items;

@property (nonatomic, strong, readonly) ObjectType first;
@property (nonatomic, strong, readonly) ObjectType second;
@property (nonatomic, strong, readonly) ObjectType third;
@property (nonatomic, strong, readonly) ObjectType fourth;

+ (instancetype)switcherWithReference:(id)reference propertyName:(NSString *)propertyName item:(ObjectType)item, ...;
- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName item:(ObjectType)item, ...;

+ (instancetype)switcherWithReference:(id)reference propertyName:(NSString *)propertyName items:(NSArray<ObjectType> *)items;
- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName items:(NSArray<ObjectType> *)items NS_DESIGNATED_INITIALIZER;

@end
