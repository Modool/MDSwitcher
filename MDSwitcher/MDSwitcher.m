//
//  MDSwitcher.m
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDSwitcher.h"
#import "MDSwitcher+Private.h"

#import "MDSwitcherAbility+Private.h"

@implementation MDSwitcher

+ (instancetype)switcherWithReference:(id)reference propertyName:(NSString *)propertyName item:(id)item, ... {
    NSParameterAssert(reference && propertyName.length && item);
    va_list list;
    va_start(list, item);

    NSMutableArray *items = [NSMutableArray new];
    while (item) {
        [items addObject:item];

        item = va_arg(list, id);
    }
    va_end(list);

    return [self switcherWithReference:reference propertyName:propertyName items:items];
}

- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName item:(id)item, ... {
    NSParameterAssert(reference && propertyName.length && item);
    va_list list;
    va_start(list, item);

    NSMutableArray *items = [NSMutableArray new];
    while (item) {
        [items addObject:item];
        
        item = va_arg(list, id);
    }
    va_end(list);
    return [self initWithReference:reference propertyName:propertyName items:items];
}

+ (instancetype)switcherWithReference:(id)reference propertyName:(NSString *)propertyName items:(NSArray *)items {
    NSParameterAssert(reference && propertyName.length && items.count);

    return [[self alloc] initWithReference:reference propertyName:propertyName items:items];
}

- (instancetype)initWithReference:(id)reference propertyName:(NSString *)propertyName items:(NSArray *)items {
    NSParameterAssert(reference && propertyName.length && items.count);

    if (self = [super init]) {
        _reference = reference;
        _propertyName = propertyName.copy;
        _items = items.copy;

        [MDSwitcherAbility.defaultAbility addColor:self forReference:reference];
    }
    return self;
}

- (instancetype)init {
    return [self initWithReference:nil propertyName:nil items:nil];
}

#pragma mark - accessor

- (id)first{
    return _items.firstObject;
}

- (id)second{
    if (_items.count > 1) return _items[1];
    return nil;
}

- (id)third{
    if (_items.count > 2) return _items[2];
    return nil;
}

- (id)fourth{
    if (_items.count > 3) return _items[3];
    return nil;
}

#pragma mark - private

- (void)_applyColorAtIndex:(NSUInteger)index;{
    NSParameterAssert(_reference && _propertyName.length && _items.count);

    id item = index < _items.count ? _items[index] : _items.firstObject;

    [_reference setValue:item forKey:_propertyName];
}

@end
