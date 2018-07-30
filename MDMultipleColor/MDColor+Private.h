//
//  MDColor+Private.h
//  MDMultipleColor
//
//  Created by xulinfeng on 2018/7/30.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import "MDColor.h"

@interface MDColor ()

@property (nonatomic, weak) id reference;
@property (nonatomic, copy) NSString *propertyName;

- (void)_applyColorAtIndex:(NSUInteger)index;

@end
