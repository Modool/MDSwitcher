//
//  MDColorAbility.m
//  MDMultipleColor
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDColorAbility.h"
#import "MDColor+Private.h"

@interface MDColorAbility ()

@property (nonatomic, strong) NSMapTable<id, NSMutableArray<MDColor *> *> *colors;

@end

@implementation MDColorAbility

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

- (void)_addColor:(MDColor *)color forReference:(id)reference {
    @synchronized(self) {
        NSMutableArray<MDColor *> *colors = [_colors objectForKey:reference] ?: [NSMutableArray<MDColor *> array];
        [colors addObject:color];
        
        [_colors setObject:colors forKey:reference];
    }
}

- (void)_synchronizeColors{
    NSEnumerator *enumerator = _colors.objectEnumerator;
    NSArray<MDColor *> *colors = nil;

    while ((colors = enumerator.nextObject)) {
        for (MDColor *color in colors) {
            [color _applyColorAtIndex:_index];
        }
    }
}

#pragma mark - protected

- (void)addColor:(MDColor *)color forReference:(id)reference {
    @synchronized(self) {
        [self _addColor:color forReference:reference];
    }
}

#pragma mark - public

+ (instancetype)defaultAbility{
    static MDColorAbility *ability = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ability = [[self alloc] init];
        ability.colors = [NSMapTable<id, NSMutableArray<MDColor *> *> weakToStrongObjectsMapTable];
    });
    return ability;
}

@end
