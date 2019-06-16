//
//  infinitenion_iosTests.m
//  infinitenion_iosTests
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperComplexFactory.h"

@interface infinitenion_iosTests : XCTestCase

@end

@implementation infinitenion_iosTests {
    SuperComplexFactory *factory;
    id<SuperComplex> zero;
    id<SuperComplex> nan;
    id<SuperComplex> one;
    id<SuperComplex> minusOne;
    id<SuperComplex> i;
    id<SuperComplex> j;
    id<SuperComplex> k;
}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    factory = [SuperComplexFactory new];
    zero = [factory zero];
    nan = [factory nan];
    one = [factory real:1];
    minusOne = [factory real:-1];
    i = [factory real:zero image:one];
    j = [factory real:zero image:one height:2];
    k = [factory real:zero image:i];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testI {
    XCTAssert([[i mul:i] isEqual:minusOne]);
    XCTAssert([[j mul:j] isEqual:minusOne]);
    XCTAssert([[k mul:k] isEqual:minusOne]);
}

- (void)testQuartanion {
    XCTAssert([[i mul:j].negate isEqual:[j mul:i]]);
    XCTAssert([[j mul:k].negate isEqual:[k mul:j]]);
    XCTAssert([[k mul:i].negate isEqual:[i mul:k]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
