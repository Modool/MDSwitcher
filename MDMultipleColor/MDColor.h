//
//  MDColor.h
//  MDMultipleColor
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDColor : NSObject

@property (nonatomic, copy, readonly) NSArray<UIColor *> *colors;

@property (nonatomic, strong, readonly) UIColor *first;
@property (nonatomic, strong, readonly) UIColor *second;
@property (nonatomic, strong, readonly) UIColor *third;
@property (nonatomic, strong, readonly) UIColor *fourth;

+ (instancetype)colorWithReference:(id)reference propertyName:(NSString *)propertyName color:(UIColor *)color, ...;
- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName color:(UIColor *)color, ...;

+ (instancetype)colorWithReference:(id)reference propertyName:(NSString *)propertyName colors:(NSArray *)colors;
- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName colors:(NSArray *)colors NS_DESIGNATED_INITIALIZER;

@end
