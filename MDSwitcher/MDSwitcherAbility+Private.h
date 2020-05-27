//
//  MDSwitcherAbility+Private.h
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/30.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDSwitcherAbility.h"

@interface MDSwitcherAbility ()

- (void)addSwitcher:(MDSwitcher *)switcher forTarget:(id)target;

- (void)removeSwitchersByProperty:(NSString *)property forTarget:(id)target;
- (void)removeSwitchersForTarget:(id)target;

@end
