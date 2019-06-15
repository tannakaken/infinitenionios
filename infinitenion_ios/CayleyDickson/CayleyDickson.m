//
//  CayleyDickson.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "CayleyDickson.h"
#import "SuperComplexFactory.h"

@implementation CayleyDickson

@synthesize height = _height;
@synthesize real = _real;
@synthesize image = _image;

static SuperComplexFactory *factory;

- (instancetype)initWithReal:(CayleyDickson *)real withImage:(CayleyDickson *)image withHeight:(NSUInteger)height {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^() {
        factory = [SuperComplexFactory getInstance];
    });
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
    return [factory real:self.real.negate image:self.image.negate];
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

- (double)realReal {
    return self.real.realReal;
}

- (NSString *)description {
    return @"";
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return true;
    }
    if (object == nil) {
        return false;
    }
    if (![object isMemberOfClass:CayleyDickson.class]) {
        return false;
    }
    CayleyDickson *c = (CayleyDickson *)object;
    return [self.real isEqual:c.real] && [self.image isEqual:c.image];
}

@end
