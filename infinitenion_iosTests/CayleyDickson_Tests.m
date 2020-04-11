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
    XCTAssert([[[i mul:j] mul:k] isEqual:minusOne]);
}

- (void)testOctonion {
    NSMutableString *table = [NSMutableString stringWithString:@"\n |"];
    for (int i = 0; i < 8; ++i) {
        [table appendFormat:@"      %d|", i];
    }
    [table appendString:@"\n"];
    for (int i = 0; i < 8; ++i) {
        [table appendFormat:@"%d|", i];
        id<SuperComplex> a = [factory imaginaryUnitOfNth:i];
        for (int j = 0; j < 8; ++ j) {
            id<SuperComplex> b = [factory imaginaryUnitOfNth:j];
            id<SuperComplex> mul = [a mul:b];
            [table appendFormat:@"%7s|", mul.description.UTF8String];
        }
        [table appendString:@"\n"];
    }
    NSLog(@"%@", table);
    id<SuperComplex> a = [one mul:l];
    NSLog(@"%@", a.real);
    NSLog(@"%@", a.image);
    NSLog(@"%lu", a.height);
    XCTAssert([[[i mul:j] mul:l].negate isEqual:[i mul:[j mul:l]]]);
}

- (void)testSedenion {
    XCTAssert([[[imaginaries[3] add:imaginaries[10]] mul:[imaginaries[6] sub:imaginaries[15]]] isEqual:zero]);
}

- (void)testStringifying {
    XCTAssert([@"1" isEqualToString:one.description]);
    XCTAssert([@"E1" isEqualToString:i.description]);
    XCTAssert([@"1 2 E1 * +" isEqualToString:[one add:[i mul:two]].description]);
    XCTAssert([@"E2" isEqualToString:j.description]);
    XCTAssert([@"E3" isEqualToString:k.description]);
    XCTAssert([@"E4" isEqualToString:l.description]);
    XCTAssert([@"E5" isEqualToString:m.description]);
    XCTAssert([@"E6" isEqualToString:n.description]);
    XCTAssert([@"E7" isEqualToString:o.description]);
}

- (void)testParsing {
    NSLog(@"%@", SuperComplexFromString(@"E1"));
    XCTAssert([SuperComplexFromString(@"E1") isEqual:i]);
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
