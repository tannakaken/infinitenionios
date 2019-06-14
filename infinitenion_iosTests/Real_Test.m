//
//  Real_Test.m
//  infinitenion_iosTests
//
//  Created by Kensaku Tanaka on 2019/06/05.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperComplexFactory.h"

@interface Real_Test : XCTestCase
@property (nonatomic) SuperComplexFactory *factory;
@end

@implementation Real_Test

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.factory = [SuperComplexFactory new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDescription {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    id<SuperComplex> r = [self.factory real:1.5];
    XCTAssert([[r description] isEqualToString:@"1.5"]);
}

- (void)testEqual {
    id<SuperComplex> r1 = [self.factory real:1];
    id<SuperComplex> r2 = [self.factory real:1];
    XCTAssert([r1 isEqual:r2]);
}

- (void)testHeight {
    id<SuperComplex> r = [self.factory real:3.14];
    XCTAssertEqual(r.height, 0);
}

- (void)testRealOfReal {
    id<SuperComplex> r = [self.factory real:2.71];
    XCTAssertEqual(r.real, r);
}

- (void)testImageOfRealIsZero {
    id<SuperComplex> r = [self.factory real:1.23];
    id<SuperComplex> zero = [self.factory zero];
    XCTAssertEqual(r.image, zero);
}

- (void)testAdd {
    id<SuperComplex> one = [self.factory real:1];
    id<SuperComplex> two = [self.factory real:2];
    XCTAssert([[one add:two] isEqual:[self.factory real:3]]);
}

- (void)testSub {
    id<SuperComplex> one = [self.factory real:1];
    id<SuperComplex> two = [self.factory real:2];
    XCTAssert([[one sub:two] isEqual:[self.factory real:-1]]);
}

- (void)testMul {
    id<SuperComplex> two = [self.factory real:2];
    id<SuperComplex> three = [self.factory real:3];
    XCTAssert([[two mul:three] isEqual:[self.factory real:6]]);
}

- (void)testDiv {
    id<SuperComplex> three = [self.factory real:3];
    id<SuperComplex> two = [self.factory real:2];
    XCTAssert([[three div:two] isEqual:[self.factory real:1.5]]);
}

- (void)testNegate {
    id<SuperComplex> four = [self.factory real:4];
    XCTAssert([[four negate] isEqual:[self.factory real:-4]]);
}

- (void)testConj {
    id<SuperComplex> five = [self.factory real:5];
    XCTAssert([[five conj] isEqual:[self.factory real:5]]);
}

- (void)testInverse {
    id<SuperComplex> six = [self.factory real:6];
    XCTAssert([[six inverse] isEqual:[self.factory real:1.0/6.0]]);
}

- (void)testSquareAbs {
    id<SuperComplex> seven = [self.factory real:7];
    XCTAssertEqual([seven sqareAbs], 49.0);
}

- (void)testNotNan {
    id<SuperComplex> eight = [self.factory real:8];
    XCTAssertFalse(eight.isNaN);
}

- (void)testZeroDivision {
    id <SuperComplex> zero = [self.factory zero];
    XCTAssert(zero.inverse.isNaN);
}

- (void)testCalcWithNan {
    id<SuperComplex> one = [self.factory real:1];
    id<SuperComplex> nan = [self.factory nan];
    XCTAssert([one add:nan].isNaN);
    XCTAssert([one sub:nan].isNaN);
    XCTAssert([one mul:nan].isNaN);
    XCTAssert([one div:nan].isNaN);
}

- (void)testCalcWithZero {
    id<SuperComplex> two = [self.factory real:2];
    id<SuperComplex> zero = [self.factory zero];
    XCTAssert([[two add:zero] isEqual:two]);
    XCTAssert([[two sub:zero] isEqual:two]);
    XCTAssert([[two mul:zero] isEqual:zero]);
    XCTAssert([two div:zero].isNaN);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
