//
//  NaN_Test.m
//  infinitenion_iosTests
//
//  Created by Kensaku Tanaka on 2019/06/16.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperComplexFactory.h"

@interface NaN_Test : XCTestCase

@end

@implementation NaN_Test {
    SuperComplexFactory *factory;
    id<SuperComplex> nan;
    id<SuperComplex> zero;
    id<SuperComplex> one;
    id<SuperComplex> two;
    id<SuperComplex> c;
}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    factory = [SuperComplexFactory new];
    nan = [factory nan];
    zero = [factory zero];
    one = [factory real:1];
    two = [factory real:2];
    c = [factory real:one image:two];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDescription {
    XCTAssert([nan.description isEqualToString:@"nan"]);
}

- (void)testEqual {
    XCTAssert([nan isEqual:nan]);
}

- (void)testNotEqual {
    XCTAssertFalse([nan isEqual:two]);
    XCTAssertFalse([nan isEqual:zero]);
    XCTAssertFalse([nan isEqual:[factory real:two image:one]]);
}

- (void)testHeight {
    XCTAssertEqual(nan.height, 0);
}

- (void)testRealOfZero {
    XCTAssert([nan.real isEqual:nan]);
}

- (void)testImageOfZero {
    XCTAssert([nan.image isEqual:nan]);
}

- (void)testAdd {
    XCTAssert([[nan add:nan] isEqual:nan]);
    XCTAssert([[nan add:zero] isEqual:nan]);
    XCTAssert([[nan add:one] isEqual:nan]);
    XCTAssert([[nan add:c] isEqual:nan]);
}

- (void)testSub {
    XCTAssert([[nan sub:nan] isEqual:nan]);
    XCTAssert([[nan sub:zero] isEqual:nan]);
    XCTAssert([[nan sub:one] isEqual:nan]);
    XCTAssert([[nan sub:c] isEqual:nan]);
}

- (void)testMul {
    XCTAssert([[nan mul:nan] isEqual:nan]);
    XCTAssert([[nan mul:zero] isEqual:nan]);
    XCTAssert([[nan mul:one] isEqual:nan]);
    XCTAssert([[nan mul:c] isEqual:nan]);
}

- (void)testDiv {
    XCTAssert([[nan div:nan] isEqual:nan]);
    XCTAssert([[nan div:zero] isEqual:nan]);
    XCTAssert([[nan div:one] isEqual:nan]);
    XCTAssert([[nan div:c] isEqual:nan]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testNegate {
    XCTAssert([nan.negate isEqual:nan]);
}

- (void)testConj {
    XCTAssert([nan.conj isEqual:nan]);
}

- (void)testInverse {
    XCTAssert([nan.inverse isEqual:nan]);
}

- (void)testSquareAbs {
    XCTAssert(isnan(nan.sqareAbs));
}

- (void)testIsNotZero {
    XCTAssertFalse(nan.isZero);
}

- (void)testIsNan {
    XCTAssert(nan.isNaN);
}

- (void)testRealReal {
    XCTAssert(isnan(nan.realReal));
}

@end
