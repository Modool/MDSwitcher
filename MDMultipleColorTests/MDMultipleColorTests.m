//
//  MDMultipleColorTests.m
//  MDMultipleColorTests
//
//  Created by xulinfeng on 2018/7/27.
//  Copyright © 2018年 markejave. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MDColor.h"
#import "MDColorAbility.h"

@interface MDMultipleColorTests : XCTestCase

@property (nonatomic, strong) UIColor *whiteColor;
@property (nonatomic, strong) UIColor *blackColor;
@property (nonatomic, strong) UIColor *redColor;

@property (nonatomic, strong) UIColor *color;

@end

@implementation MDMultipleColorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.whiteColor = [UIColor whiteColor];
    self.blackColor = [UIColor blackColor];
    self.redColor = [UIColor redColor];

    self.color = [[MDColor colorWithReference:self propertyName:@"color" color:_whiteColor, _blackColor, _redColor, nil] first];
}

- (void)testDefaultColor {
    XCTAssertEqual(self.color, self.whiteColor);
}

- (void)testWhiteColor {
    MDColorAbility.defaultAbility.index = 0;

    XCTAssertEqual(self.color, self.whiteColor);
}

- (void)testBlackColor {
    MDColorAbility.defaultAbility.index = 1;
    XCTAssertEqual(self.color, self.blackColor);
}

- (void)testRedColor {
    MDColorAbility.defaultAbility.index = 2;
    XCTAssertEqual(self.color, self.redColor);
}

@end
