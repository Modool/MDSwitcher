//
//  MDSwitcherAbility.h
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <Foundation/Foundation.h>

/// This class to control MDSwitcher ability,
/// whose selection of items applied by this index.
@interface MDSwitcherAbility : NSObject

/// Index to apply MDSwitcher items
@property (nonatomic, assign) NSUInteger index;

/// Default instance
+ (instancetype)defaultAbility;

@end
