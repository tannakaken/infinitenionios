//
//  Calc_Test.m
//  infinitenion_iosTests
//
//  Created by 田中健策 on 2020/08/15.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperComplexFactory.h"

@interface Calc_Tests : XCTestCase

@end

@implementation Calc_Tests {
    SuperComplexFactory *factory;
    id<SuperComplex> zero;
    id<SuperComplex> nan;
    id<SuperComplex> one;
    id<SuperComplex> two;
    id<SuperComplex> minusOne;
    id<SuperComplex> i,j,k,l,m,n,o;
    NSMutableArray<id<SuperComplex>> *imaginaries;
}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    factory = [SuperComplexFactory new];
    zero = [factory zero];
    nan = [factory nan];
    one = [factory real:1];
    two = [factory real:2];
    minusOne = [factory real:-1];
    i = [factory imaginaryUnitOfNth:1];
    j = [factory imaginaryUnitOfNth:2];
    k = [factory imaginaryUnitOfNth:3];
    l = [factory imaginaryUnitOfNth:4];
    m = [factory imaginaryUnitOfNth:5];
    n = [factory imaginaryUnitOfNth:6];
    o = [factory imaginaryUnitOfNth:7];
    imaginaries = [NSMutableArray new];
    for (int i = 0; i < 16; ++i) {
        [imaginaries addObject:[factory imaginaryUnitOfNth:i]];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCalc {
    XCTAssert([SuperComplexFromString(@"E1 E1 *") isEqual:minusOne]);
    XCTAssert([SuperComplexFromString(@"E1 E2 *") isEqual:k]);
    XCTAssert([SuperComplexFromString(@"E2 E1 *") isEqual:k.negate]);
    XCTAssert([SuperComplexFromString(@"E3 E10 + E6 E15 - *") isEqual:zero]);
}

@end
