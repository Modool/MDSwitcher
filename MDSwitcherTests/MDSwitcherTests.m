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
@property (nonatomic, strong) UIFont *defaultFont;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIFont *font;

@end

@implementation MDSwitcherTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.whiteColor = [UIColor whiteColor];
    self.blackColor = [UIColor blackColor];
    self.redColor = [UIColor redColor];
    self.defaultFont = [UIFont systemFontOfSize:10];

//    MDS(self, backgroundColor) = @[_whiteColor, _blackColor, _redColor];
    MDS(self, font) = self.defaultFont;

//    MDS(self, backgroundColor) = MDSTuple(_whiteColor, _blackColor, _redColor);

    __weak __block MDSwitcherTests *weakSelf = self;
//    MDS(self, backgroundColor) = MDSTuple(^id{
//        if (1) return weakSelf.whiteColor;
//        else return [UIColor blackColor];
//    }, _blackColor, _redColor);

    MDS(self, backgroundColor) = @[^id{
        if (weakSelf) return weakSelf.whiteColor;
        else return [UIColor blackColor];
    }, _blackColor, _redColor];
}

- (void)testDefault {
    XCTAssertEqual(self.backgroundColor, self.whiteColor);
    XCTAssertEqual(self.font, self.defaultFont);
}

- (void)testWhiteColor {
    MDSwitcherAbility.defaultAbility.index = 0;

    XCTAssertEqual(self.backgroundColor, self.whiteColor);
    XCTAssertEqual(self.font, self.defaultFont);
}

- (void)testBlackColor {
    MDSwitcherAbility.defaultAbility.index = 1;

    XCTAssertEqual(self.backgroundColor, self.blackColor);
}

- (void)testRedColor {
    MDSwitcherAbility.defaultAbility.index = 2;

    XCTAssertEqual(self.backgroundColor, self.redColor);
}

@end
