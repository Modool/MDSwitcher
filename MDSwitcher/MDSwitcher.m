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

+ (instancetype)switcherWithTarget:(id)target property:(NSString *)property item:(id)item, ... {
    NSParameterAssert(target && property.length && item);
    va_list list;
    va_start(list, item);

    NSMutableArray *items = [NSMutableArray new];
    while (item) {
        [items addObject:item];

        item = va_arg(list, id);
    }
    va_end(list);

    return [self switcherWithTarget:target property:property items:items];
}

- (instancetype)initWithTarget:(id)target property:(NSString *)property item:(id)item, ... {
    NSParameterAssert(target && property.length && item);
    va_list list;
    va_start(list, item);

    NSMutableArray *items = [NSMutableArray new];
    while (item) {
        [items addObject:item];
        
        item = va_arg(list, id);
    }
    va_end(list);
    return [self initWithTarget:target property:property items:items];
}

+ (instancetype)switcherWithTarget:(id)target property:(NSString *)property items:(NSArray *)items {
    NSParameterAssert(target && property.length && items.count);

    return [[self alloc] initWithTarget:target property:property items:items];
}

- (instancetype)initWithTarget:(id)target property:(NSString *)property items:(NSArray *)items {
    NSParameterAssert(target && property.length && items.count);

    if (self = [super init]) {
        _target = target;
        _property = property.copy;
        _items = items.copy;

        [MDSwitcherAbility.defaultAbility addSwitcher:self forTarget:target];
    }
    return self;
}

- (instancetype)init {
    return [self initWithTarget:nil property:nil items:nil];
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

- (void)_applyAtIndex:(NSUInteger)index;{
    NSParameterAssert(_target && _property.length && _items.count);

    id item = index < _items.count ? _items[index] : _items.firstObject;

    [_target setValue:item forKey:_property];
}

@end
