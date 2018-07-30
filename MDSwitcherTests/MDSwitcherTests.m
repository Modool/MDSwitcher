//
//  MDSwitcherTests.m
//  MDSwitcherTests
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MDSwitcher.h"
#import "MDSwitcherAbility.h"

@interface MDSwitcherTests : XCTestCase

@property (nonatomic, strong) UIColor *whiteColor;
@property (nonatomic, strong) UIColor *blackColor;
@property (nonatomic, strong) UIColor *redColor;

@property (nonatomic, strong) UIColor *color;

@end

@implementation MDSwitcherTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.whiteColor = [UIColor whiteColor];
    self.blackColor = [UIColor blackColor];
    self.redColor = [UIColor redColor];

    self.color = [MDSwitcherRefer(self, color, _whiteColor, _blackColor, _redColor) first];
//    self.color = [[MDSwitcher switcherWithTarget:self property:@"color" item:_whiteColor, _blackColor, _redColor] first];
}

- (void)testDefaultColor {
    XCTAssertEqual(self.color, self.whiteColor);
}

- (void)testWhiteColor {
    MDSwitcherAbility.defaultAbility.index = 0;

    XCTAssertEqual(self.color, self.whiteColor);
}

- (void)testBlackColor {
    MDSwitcherAbility.defaultAbility.index = 1;
    XCTAssertEqual(self.color, self.blackColor);
}

- (void)testRedColor {
    MDSwitcherAbility.defaultAbility.index = 2;
    XCTAssertEqual(self.color, self.redColor);
}

@end
