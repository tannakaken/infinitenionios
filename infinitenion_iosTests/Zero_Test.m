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
@property (nonatomic) SuperComplexFactory *factory;
@property (nonatomic) id<SuperComplex> zero;
@end

@implementation Zero_Test

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.factory = [SuperComplexFactory new];
    self.zero = [self.factory zero];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDescription {
    XCTAssert([self.zero.description isEqualToString:@"0"]);
}

- (void)testEqual {
    XCTAssert([self.zero isEqual:[self.factory zero]]);
}

- (void)testNotEqual {
    XCTAssertFalse([self.zero isEqual:[self.factory real:2]]);
    XCTAssertFalse([self.zero isEqual:[self.factory nan]]);
    XCTAssertFalse([self.zero isEqual:[self.factory real:[self.factory real:1]
                                                   image:[self.factory real:2]]]);
}

- (void)testHeight {
    XCTAssertEqual(self.zero.height, 0);
}

- (void)testRealOfZero {
    XCTAssert([self.zero.real isEqual:self.zero]);
}

- (void)testImageOfZero {
    XCTAssert([self.zero.image isEqual:self.zero]);
}

- (void)testAdd {
    XCTAssert([[self.zero add:[self.factory zero]] isEqual:self.zero]);
    XCTAssert([[self.zero add:[self.factory nan]] isEqual:[self.factory nan]]);
    id<SuperComplex> r = [self.factory real:1];
    XCTAssert([[self.zero add:r] isEqual:r]);
    id<SuperComplex> c = [self.factory real:[self.factory real:1] image:[self.factory real:2]];
    XCTAssert([[self.zero add:c] isEqual:c]);
}

- (void)testSub {
    XCTAssert([[self.zero sub:[self.factory zero]] isEqual:self.zero]);
    XCTAssert([[self.zero sub:[self.factory nan]] isEqual:[self.factory nan]]);
    id<SuperComplex> r = [self.factory real:1];
    XCTAssert([[self.zero sub:r] isEqual:r.negate]);
    id<SuperComplex> c = [self.factory real:[self.factory real:1] image:[self.factory real:2]];
    XCTAssert([[self.zero sub:c] isEqual:c.negate]);
}

- (void)testMul {
    XCTAssert([[self.zero mul:[self.factory zero]] isEqual:self.zero]);
    XCTAssert([[self.zero mul:[self.factory nan]] isEqual:[self.factory nan]]);
    id<SuperComplex> r = [self.factory real:1];
    XCTAssert([[self.zero mul:r] isEqual:self.zero]);
    id<SuperComplex> c = [self.factory real:[self.factory real:1] image:[self.factory real:2]];
    XCTAssert([[self.zero mul:c] isEqual:self.zero]);
}

- (void)testDiv {
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
