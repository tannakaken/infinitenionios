//
//  SuperComplexFactory.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/12.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "SuperComplexFactory.h"
#import "Zero.h"
#import "NaN.h"
#import "Real.h"
#import "CayleyDickson.h"

@implementation SuperComplexFactory
- (nonnull id<SuperComplex>)zero {
    return [Zero zero];
}

- (nonnull id<SuperComplex>)nan {
    return [NaN nan];
}

- (nonnull id<SuperComplex>)real:(double)real {
    return [self simplify:[[Real alloc] initWithReal:real]];
}

- (nonnull id<SuperComplex>)real:(nonnull id<SuperComplex>)real
                           image:(nonnull id<SuperComplex>)image {
    if (real.isNaN || image.isNaN) {
        return [self nan];
    }
    id<SuperComplex> superComplex = [[CayleyDickson alloc] initWithReal:real
                                                              withImage:image
                                                             withHeight:MAX(real.height,image.height)+1];
    return [self simplify:superComplex];
}

- (nonnull id<SuperComplex>)simplify:(id<SuperComplex>)superComplex {
    if (superComplex.isZero) {
        return [self zero];
    }
    if (superComplex.image.isZero) {
        return [self simplify:superComplex.real];
    }
    return [[CayleyDickson alloc] initWithReal:[self simplify:superComplex.real]
                                     withImage:[self simplify:superComplex.image]
                                    withHeight:superComplex.height];
}

@end
