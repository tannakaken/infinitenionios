//
//  SuperComplexFactory.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/12.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "SuperComplexFactory.h"
@implementation SuperComplexFactory
- (nonnull id<SuperComplex>)zero {
    return nil;
}

- (nonnull id<SuperComplex>)nan {
    return nil;
}

- (nonnull id<SuperComplex>)real:(double *)real {
    return nil;
}

- (nonnull id<SuperComplex>)real:(id<SuperComplex>)real image:(id<SuperComplex>)image {
    return nil;
}

+ (instancetype)defaultFactory {
    return nil;
}
@end
