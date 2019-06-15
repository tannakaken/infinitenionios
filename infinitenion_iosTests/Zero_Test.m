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

- (void)testExample {
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
