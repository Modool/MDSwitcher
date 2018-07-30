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

@property (nonatomic, strong) NSMapTable<id, NSMutableArray<MDSwitcher *> *> *colors;

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

- (void)_addColor:(MDSwitcher *)color forReference:(id)reference {
    @synchronized(self) {
        NSMutableArray<MDSwitcher *> *colors = [_colors objectForKey:reference] ?: [NSMutableArray<MDSwitcher *> array];
        [colors addObject:color];
        
        [_colors setObject:colors forKey:reference];
    }
}

- (void)_synchronizeColors{
    NSEnumerator *enumerator = _colors.objectEnumerator;
    NSArray<MDSwitcher *> *colors = nil;

    while ((colors = enumerator.nextObject)) {
        for (MDSwitcher *color in colors) {
            [color _applyColorAtIndex:_index];
        }
    }
}

#pragma mark - protected

- (void)addColor:(MDSwitcher *)color forReference:(id)reference {
    @synchronized(self) {
        [self _addColor:color forReference:reference];
    }
}

#pragma mark - public

+ (instancetype)defaultAbility{
    static MDSwitcherAbility *ability = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ability = [[self alloc] init];
        ability.colors = [NSMapTable<id, NSMutableArray<MDSwitcher *> *> weakToStrongObjectsMapTable];
    });
    return ability;
}

@end
