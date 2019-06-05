//
//  Real.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/03.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "Real.h"
#import "Zero.h"
#import "CayleyDickson.h"

@interface Real()
@property (nonatomic,readonly) double value;
@end

@implementation Real

@synthesize real = _real;
@synthesize image = _image;
@synthesize height = _height;

- (instancetype)initWithReal:(double)real {
    self = [super init];
    if (self) {
        _value = real;
        _real = self;
        _image = [Zero zero];
        _height = 0;
    }
    return self;
}

- (nonnull id<SuperComplex>)add:(nonnull id<SuperComplex>)other {
    if (other.height == 0) {
        return [[Real alloc] initWithReal:self.value + ((Real *)other).value];
    }
    return [[CayleyDickson alloc] initWithReal:[self add:other.real]
                                     withImage:other.image
                                    withHeight:other.height];
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
    if (other.height == 0) {
        return [[Real alloc] initWithReal:self.value - ((Real *)other).value];
    }
    return [[CayleyDickson alloc] initWithReal:[self sub:other.real]
                                     withImage:other.image
                                    withHeight:other.height];
}

- (NSString *)description {
    return @(self.value).stringValue;
}

- (BOOL)isEqual:(id)object {
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
