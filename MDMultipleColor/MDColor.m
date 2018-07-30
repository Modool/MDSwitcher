//
//  MDColor.m
//  MDMultipleColor
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDColor.h"
#import "MDColor+Private.h"

#import "MDColorAbility+Private.h"

@implementation MDColor

+ (instancetype)colorWithReference:(id)reference propertyName:(NSString *)propertyName color:(UIColor *)color, ... {
    NSParameterAssert(reference && propertyName.length && color);
    va_list list;
    va_start(list, color);

    NSMutableArray *colors = [NSMutableArray new];
    while (color) {
        [colors addObject:color];

        color = va_arg(list, UIColor *);
    }
    va_end(list);

    return [self colorWithReference:reference propertyName:propertyName colors:colors];
}

- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName color:(UIColor *)color, ... {
    NSParameterAssert(reference && propertyName.length && color);
    va_list list;
    va_start(list, color);

    NSMutableArray *colors = [NSMutableArray new];
    while (color) {
        [colors addObject:color];
        
        color = va_arg(list, UIColor *);
    }
    va_end(list);
    return [self initWithReference:reference propertyName:propertyName colors:colors];
}

+ (instancetype)colorWithReference:(id)reference propertyName:(NSString *)propertyName colors:(NSArray *)colors {
    NSParameterAssert(reference && propertyName.length && colors.count);

    return [[self alloc] initWithReference:reference propertyName:propertyName colors:colors];
}

- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName colors:(NSArray *)colors {
    NSParameterAssert(reference && propertyName.length && colors.count);

    if (self = [super init]) {
        _reference = reference;
        _propertyName = propertyName.copy;
        _colors = colors.copy;

        [MDColorAbility.defaultAbility addColor:self forReference:reference];
    }
    return self;
}

- (instancetype)init {
    return [self initWithReference:nil propertyName:nil colors:nil];
}

#pragma mark - accessor

- (UIColor *)first{
    return _colors.firstObject;
}

- (UIColor *)second{
    if (_colors.count > 1) return _colors[1];
    return nil;
}

- (UIColor *)third{
    if (_colors.count > 2) return _colors[2];
    return nil;
}

- (UIColor *)fourth{
    if (_colors.count > 3) return _colors[3];
    return nil;
}

#pragma mark - private

- (void)_applyColorAtIndex:(NSUInteger)index;{
    NSParameterAssert(_reference && _propertyName.length && _colors.count);

    UIColor *color = index < _colors.count ? _colors[index] : _colors.firstObject;

    [_reference setValue:color forKey:_propertyName];
}

@end
