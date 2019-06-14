//
//  CayleyDickson.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "CayleyDickson.h"

@implementation CayleyDickson

@synthesize height = _height;
@synthesize real = _real;
@synthesize image = _image;

- (instancetype)initWithReal:(CayleyDickson *)real withImage:(CayleyDickson *)image withHeight:(NSUInteger)height {
    self = [super init];
    if (self) {
        _real = real;
        _image = image;
        _height = height;
    }
    return self;
}

- (nonnull id<SuperComplex>)add:(nonnull id<SuperComplex>)other {
    return nil;
}

- (nonnull id<SuperComplex>)conj {
    return nil;
}

- (nonnull id<SuperComplex>)div:(nonnull id<SuperComplex>)other {
    return nil;
}

- (nonnull id<SuperComplex>)mul:(nonnull id<SuperComplex>)other {
    return nil;
}

- (nonnull id<SuperComplex>)negate {
    return nil;
}

- (nonnull id<SuperComplex>)sub:(nonnull id<SuperComplex>)other {
    return nil;
}

- (nonnull id<SuperComplex>)inverse {
    return nil;
}

- (double)sqareAbs {
    return self.real.sqareAbs + self.image.sqareAbs;
}

- (BOOL)isZero {
    return self.real.isZero && self.image.isZero;
}

- (BOOL)isNaN {
    return false;
}

- (NSString *)description {
    return @"";
}

@end
