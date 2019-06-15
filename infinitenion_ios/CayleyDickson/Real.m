//
//  Real.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/03.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "Real.h"
#import "SuperComplexFactory.h"
#import <math.h>

@interface Real()
@property (nonatomic,readonly) double value;
@end

@implementation Real

@synthesize real = _real;
@synthesize image = _image;
@synthesize height = _height;

static SuperComplexFactory *factory;

- (instancetype)initWithReal:(double)real {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^() {
        factory = [SuperComplexFactory getInstance];
    });
    self = [super init];
    if (self) {
        _value = real;
        _real = self;
        _image = [factory zero];
        _height = 0;
    }
    return self;
}

- (nonnull id<SuperComplex>)add:(nonnull id<SuperComplex>)other {
    if (other.height == 0) {
        return [factory real:self.value + other.realReal];
    }
    return [factory real:[self add:other.real] image:other.image];
}

- (nonnull id<SuperComplex>)sub:(nonnull id<SuperComplex>)other {
    if (other.height == 0) {
        return [factory real: self.value - other.realReal];
    }
    return [factory real:[self sub:other.real] image:other.image];
}

- (nonnull id<SuperComplex>)mul:(nonnull id<SuperComplex>)other {
    if (other.height == 0) {
        return [factory real:self.value * other.realReal];
    }
    return [factory real:[self mul:other.real] image:[self mul:other.image]];
}

- (nonnull id<SuperComplex>)div:(nonnull id<SuperComplex>)other {
    return [self mul:other.inverse];
}

- (nonnull id<SuperComplex>)negate {
    return [factory real:-self.value];
}

- (nonnull id<SuperComplex>)conj {
    return self;
}

- (nonnull id<SuperComplex>)inverse {
    assert(self.value != 0);
    return [factory real:1/self.value];
}

- (double)sqareAbs {
    return self.value * self.value;
}

- (BOOL)isZero {
    return self.value == 0.0;
}

- (BOOL)isNaN {
    return isnan(self.value);
}

- (double) realReal {
    return self.value;
}

- (NSString *)description {
    return @(self.value).stringValue;
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return true;
    }
    if (object == nil) {
        return false;
    }
    if (![object isMemberOfClass:Real.class]) {
        return false;
    }
    Real *r = (Real *)object;
    return self.value == r.value;
}

@end
