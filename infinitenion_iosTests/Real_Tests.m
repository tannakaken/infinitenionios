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
@end

@implementation Real_Test {
    SuperComplexFactory *factory;
    id<SuperComplex> minusone;
    id<SuperComplex> zero;
    id<SuperComplex> one;
    id<SuperComplex> two;
    id<SuperComplex> three;
    id<SuperComplex> nan;
}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    factory = [SuperComplexFactory new];
    zero = [factory zero];
    nan = [factory nan];
    minusone = [factory real:-1];
    one = [factory real:1];
    two = [factory real:2];
    three = [factory real:3];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDescription {
    id<SuperComplex> r = [factory real:1.5];
    XCTAssert([[r description] isEqualToString:@"1.5"]);
}

- (void)testEqual {
    XCTAssert([one isEqual:one]);
}

- (void)testNotEqual {
    XCTAssertFalse([one isEqual:two]);
    XCTAssertFalse([one isEqual:zero]);
    XCTAssertFalse([one isEqual:nan]);
    XCTAssertFalse([one isEqual:[factory real:one image:two]]);
}

- (void)testHeight {
    id<SuperComplex> r = [factory real:3.14];
    XCTAssertEqual(r.height, 0);
}

- (void)testRealOfReal {
    id<SuperComplex> r = [factory real:2.71];
    XCTAssert([r.real isEqual:r]);
}

- (void)testImageOfRealIsZero {
    id<SuperComplex> r = [factory real:1.23];
    XCTAssert([r.image isEqual:zero]);
}

- (void)testAdd {
    XCTAssert([[one add:two] isEqual:three]);
    
    XCTAssert([[one add:zero] isEqual:one]);
    
    XCTAssert([[one add:nan] isEqual:nan]);
    
    id<SuperComplex> zeroone = [factory real:zero image:one];
    id<SuperComplex> oneone = [factory real:one image:one];
    XCTAssert([[one add:zeroone] isEqual:oneone]);
    XCTAssert([[[factory real:-1] add:oneone] isEqual:zeroone]);
}

- (void)testSub {
    XCTAssert([[minusone sub:two] isEqual:[factory real:-3]]);
    
    XCTAssert([[minusone sub:zero] isEqual:minusone]);
    
    XCTAssert([[minusone sub:nan] isEqual:[factory nan]]);
    
    id<SuperComplex> minusonetwo = [factory real:minusone image:two];
    id<SuperComplex> zerominustwo = [factory real:zero image:two.negate];
    XCTAssert([[minusone sub:minusonetwo] isEqual:zerominustwo]);
}

- (void)testMul {
    XCTAssert([[two mul:three] isEqual:[factory real:6]]);
    
    XCTAssert([[two mul:zero] isEqual:zero]);
    XCTAssert([[two mul:nan] isEqual:nan]);
    
    id<SuperComplex> twothree = [factory real:two image:three];
    XCTAssert([[two mul:twothree] isEqual:[factory real:[factory real:4] image:[factory real:6]]]);
    
}

- (void)testDiv {
    XCTAssert([[three div:two] isEqual:[factory real:1.5]]);
    
    XCTAssert([[two div:zero] isEqual:nan]);
    XCTAssert([[two div:nan] isEqual:nan]);
    
    id<SuperComplex> oneone = [factory real:one image:one];
    XCTAssert([[two div:oneone] isEqual:oneone.conj]);
}

- (void)testNegate {
    id<SuperComplex> four = [factory real:4];
    XCTAssert([[four negate] isEqual:[factory real:-4]]);
}

- (void)testConj {
    id<SuperComplex> five = [factory real:5];
    XCTAssert([[five conj] isEqual:[factory real:5]]);
}

- (void)testInverse {
    id<SuperComplex> six = [factory real:6];
    XCTAssert([[six inverse] isEqual:[factory real:1.0/6.0]]);
}

- (void)testSquareAbs {
    id<SuperComplex> seven = [factory real:7];
    XCTAssertEqual([seven sqareAbs], 49.0);
}

- (void)testIsNotZero {
    XCTAssertFalse(one.isZero);
}

- (void)testIsNotNan {
    id<SuperComplex> eight = [factory real:8];
    XCTAssertFalse(eight.isNaN);
}

- (void)testZero {
    id<SuperComplex> ontherZero = [factory real:0];
    XCTAssert([ontherZero isEqual:zero]);
}

- (void)testNan {
    id<SuperComplex> ontherNan = [factory real:0.0/0.0];
    XCTAssert([ontherNan isEqual:nan]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
