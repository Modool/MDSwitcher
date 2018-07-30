//
//  MDSwitcherAbility.m
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDSwitcherAbility.h"
#import "MDSwitcher+Private.h"

@interface MDSwitcherAbility ()

@property (nonatomic, strong) NSMapTable<id, NSMutableArray<MDSwitcher *> *> *switchers;

@end

@implementation MDSwitcherAbility

#pragma mark - accessor

- (void)setIndex:(NSUInteger)index{
    @synchronized(self) {
        if (_index != index) {
            _index = index;

            [self _synchronizeColors];
        }
    }
}

#pragma mark - private

- (void)_addSwitcher:(MDSwitcher *)switcher forTarget:(id)target {
    @synchronized(self) {
        NSMutableArray<MDSwitcher *> *switchers = [_switchers objectForKey:target] ?: [NSMutableArray<MDSwitcher *> array];
        [switchers addObject:switcher];
        
        [_switchers setObject:switchers forKey:target];
    }
}

- (void)_synchronizeColors{
    NSEnumerator *enumerator = _switchers.objectEnumerator;
    NSArray<MDSwitcher *> *switchers = nil;

    while ((switchers = enumerator.nextObject)) {
        for (MDSwitcher *switcher in switchers) {
            [switcher _applyAtIndex:_index];
        }
    }
}

#pragma mark - protected

- (void)addSwitcher:(MDSwitcher *)switcher forTarget:(id)target {
    @synchronized(self) {
        [self _addSwitcher:switcher forTarget:target];
    }
}

#pragma mark - public

+ (instancetype)defaultAbility{
    static MDSwitcherAbility *ability = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ability = [[self alloc] init];
        ability.switchers = [NSMapTable<id, NSMutableArray<MDSwitcher *> *> weakToStrongObjectsMapTable];
    });
    return ability;
}

@end
