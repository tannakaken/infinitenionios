//
//  infinitenion_iosUITests.m
//  infinitenion_iosUITests
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface infinitenion_iosUITests : XCTestCase

@end

@implementation infinitenion_iosUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testSimpleCalculation {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *inputTextField = app.textFields[@"InputTextField"];
    [inputTextField tap];
    [inputTextField typeText:@"1 2 +"];
    [app.buttons[@"Return"] tap];
    XCUIElement *calcButton = app.buttons[@"CalcButton"];
    [calcButton tap];
    XCTAssert([inputTextField.value isEqualToString:@"3"]);
}

- (void)testComplexCalculation {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *inputTextField = app.textFields[@"InputTextField"];
    [inputTextField tap];
    [inputTextField typeText:@"E1 E1 *"];
    [app.buttons[@"Return"] tap];
    XCUIElement *calcButton = app.buttons[@"CalcButton"];
    [calcButton tap];
    XCTAssert([inputTextField.value isEqualToString:@"-1"]);
}

- (void)testSedenionCalculation {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *inputTextField = app.textFields[@"InputTextField"];
    [inputTextField tap];
    [inputTextField typeText:@" E3  E10 + E6 E15 - *"];
    [app.buttons[@"Return"] tap];
    XCUIElement *calcButton = app.buttons[@"CalcButton"];
    [calcButton tap];
    XCTAssert([inputTextField.value isEqualToString:@"0"]);
}


@end
