//
//  Zero_Test.m
//  infinitenion_iosTests
//
//  Created by Kensaku Tanaka on 2019/06/15.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperComplexFactory.h"

@interface Zero_Test : XCTestCase
@end

@implementation Zero_Test {
    SuperComplexFactory *factory;
    id<SuperComplex> zero;
    id<SuperComplex> nan;
    id<SuperComplex> one;
    id<SuperComplex> two;
    id<SuperComplex> c;
}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    factory = [SuperComplexFactory new];
    zero = [factory zero];
    nan = [factory nan];
    one = [factory real:1];
    two = [factory real:2];
    c = [factory real:one image:two height:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDescription {
    XCTAssert([zero.description isEqualToString:@"0"]);
}

- (void)testEqual {
    XCTAssert([zero isEqual:zero]);
}

- (void)testNotEqual {
    XCTAssertFalse([zero isEqual:two]);
    XCTAssertFalse([zero isEqual:nan]);
    XCTAssertFalse([zero isEqual:[factory real:one image:two height:1]]);
}

- (void)testHeight {
    XCTAssertEqual(zero.height, 0);
}

- (void)testRealOfZero {
    XCTAssert([zero.real isEqual:zero]);
}

- (void)testImageOfZero {
    XCTAssert([zero.image isEqual:zero]);
}

- (void)testAdd {
    XCTAssert([[zero add:zero] isEqual:zero]);
    XCTAssert([[zero add:nan] isEqual:nan]);
    XCTAssert([[zero add:one] isEqual:one]);
    XCTAssert([[zero add:c] isEqual:c]);
}

- (void)testSub {
    XCTAssert([[zero sub:zero] isEqual:zero]);
    XCTAssert([[zero sub:nan] isEqual:nan]);
    XCTAssert([[zero sub:one] isEqual:one.negate]);
    XCTAssert([[zero sub:c] isEqual:c.negate]);
}

- (void)testMul {
    XCTAssert([[zero mul:zero] isEqual:zero]);
    XCTAssert([[zero mul:nan] isEqual:nan]);
    XCTAssert([[zero mul:one] isEqual:zero]);
    XCTAssert([[zero mul:c] isEqual:zero]);
}

- (void)testDiv {
    XCTAssert([[zero div:zero] isEqual:nan]);
    XCTAssert([[zero div:nan] isEqual:nan]);
    XCTAssert([[zero div:one] isEqual:zero]);
    XCTAssert([[zero div:c] isEqual:zero]);
}

- (void)testNegate {
    XCTAssert([zero.negate isEqual:zero]);
}

- (void)testConj {
    XCTAssert([zero.conj isEqual:zero]);
}

- (void)testInverse {
    XCTAssert([zero.inverse isEqual:nan]);
}

- (void)testSquareAbs {
    XCTAssertEqual(zero.sqareAbs, 0);
}

- (void)testIsZero {
    XCTAssert(zero.isZero);
}

- (void)testIsNotNan {
    XCTAssertFalse(zero.isNaN);
}

- (void)testRealReal {
    XCTAssertEqual(zero.realReal, 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
