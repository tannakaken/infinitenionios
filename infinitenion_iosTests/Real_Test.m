//
//  Real_Test.m
//  infinitenion_iosTests
//
//  Created by Kensaku Tanaka on 2019/06/05.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Real.h"
#import "Zero.h"

@interface Real_Test : XCTestCase

@end

@implementation Real_Test

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDescription {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Real *r = [[Real alloc] initWithReal:1.5];
    XCTAssert([[r description] isEqualToString:@"1.5"]);
}

- (void)testEqual {
    Real *r1 = [[Real alloc] initWithReal:1];
    Real *r2 = [[Real alloc] initWithReal:1];
    XCTAssert([r1 isEqual:r2]);
}

- (void)testHeight {
    Real *r = [[Real alloc] initWithReal:3.14];
    XCTAssertEqual(r.height, 0);
}

- (void)testRealOfReal {
    Real *r = [[Real alloc] initWithReal:2.71];
    XCTAssertEqual(r.real, r);
}

- (void)testImageOfRealIsZero {
    Real *r = [[Real alloc] initWithReal:1.23];
    Zero *zero = [Zero zero];
    XCTAssertEqual(r.image, zero);
}

- (void)testAdd {
    Real *one = [[Real alloc] initWithReal:1];
    Real *two = [[Real alloc] initWithReal:2];
    XCTAssert([[one add:two] isEqual:[[Real alloc] initWithReal:3]]);
}

- (void)testSub {
    Real *one = [[Real alloc] initWithReal:1];
    Real *two = [[Real alloc] initWithReal:2];
    XCTAssert([[one sub:two] isEqual:[[Real alloc] initWithReal:-1]]);
}

- (void)testMul {
    Real *two = [[Real alloc] initWithReal:2];
    Real *three = [[Real alloc] initWithReal:3];
    XCTAssert([[two mul:three] isEqual:[[Real alloc] initWithReal:6]]);
}

- (void)testDiv {
    Real *three = [[Real alloc] initWithReal:3];
    Real *two = [[Real alloc] initWithReal:2];
    XCTAssert([[three div:two] isEqual:[[Real alloc] initWithReal:1.5]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
