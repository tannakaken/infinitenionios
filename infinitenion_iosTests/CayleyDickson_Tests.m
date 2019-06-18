//
//  infinitenion_iosTests.m
//  infinitenion_iosTests
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperComplexFactory.h"

@interface CayleyDickson_Tests : XCTestCase

@end

@implementation CayleyDickson_Tests {
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

- (void)testComplex {
    id<SuperComplex> diagonal = [one add:i];
    XCTAssert([[diagonal mul:diagonal] isEqual:[two mul:i]]);
}

- (void)testQuartanion {
    XCTAssert([[i mul:j].negate isEqual:[j mul:i]]);
    XCTAssert([[j mul:k].negate isEqual:[k mul:j]]);
    XCTAssert([[k mul:i].negate isEqual:[i mul:k]]);
}

- (void)testSedenion {
    XCTAssert([[[imaginaries[3] add:imaginaries[10]] mul:[imaginaries[6] sub:imaginaries[15]]] isEqual:zero]);
}

- (void)testImaginaryWithPerformance {
    [self measureBlock:^{
        for (NSUInteger i = 1; i < 4096; ++i) {
            id<SuperComplex> imaginary = [self->factory imaginaryUnitOfNth:i];
            XCTAssert([[imaginary mul:imaginary] isEqual:self->minusOne]);
        }
    }];
}

@end
