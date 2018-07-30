//
//  MDSwitcher+Private.h
//  MDSwitcher
//
//  Created by xulinfeng on 2018/7/30.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDSwitcher.h"

@interface MDSwitcher ()

@property (nonatomic, weak) id target;
@property (nonatomic, copy) NSString *property;

- (void)_applyAtIndex:(NSUInteger)index;

@end
