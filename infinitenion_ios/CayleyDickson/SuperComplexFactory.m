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

- (nonnull id<SuperComplex>)real:(id<SuperComplex>)real
                           image:(id<SuperComplex>)image
                          height:(NSUInteger)height {
    if (real.isNaN || image.isNaN) {
        return [self nan];
    }
    id<SuperComplex> superComplex = [[CayleyDickson alloc] initWithReal:real
                                                              withImage:image
                                                             withHeight:height];
    return [self simplify:superComplex];
}

- (nonnull id<SuperComplex>)simplify:(id<SuperComplex>)superComplex {
    if (superComplex.isZero) {
        return [self zero];
    }
    if (superComplex.isNaN) {
        return [self nan];
    }
    if (superComplex.height == 0) {
        return superComplex;
    }
    if (superComplex.image.isZero) {
        return [self simplify:superComplex.real];
    }
    return [[CayleyDickson alloc] initWithReal:[self simplify:superComplex.real]
                                     withImage:[self simplify:superComplex.image]
                                    withHeight:superComplex.height];
}

- (nonnull id<SuperComplex>)imaginaryUnitOfNth:(NSUInteger)nth {
    if (nth == 0) {
        return [self real:1];
    }
    NSUInteger height = 0;
    NSUInteger width = 1;
    while (width <= nth) {
        ++height;
        width *= 2;
    }
    return [self real:[self zero] image:[self imaginaryUnitOfNth:nth - width/2] height:height];
}

static SuperComplexFactory *singleton = nil;

+ (instancetype) getInstance{
    @synchronized (self) {
        if (!singleton) {
            singleton = [SuperComplexFactory new];
        }
    }
    return singleton;
}

@end
