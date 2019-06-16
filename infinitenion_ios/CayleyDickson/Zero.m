//
//  Zero.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/03.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "Zero.h"
#import "NaN.h"

@interface Zero()
@property (nonatomic, readonly) double value;
@end

@implementation Zero

@synthesize real = _real;
@synthesize image = _image;
@synthesize height = _height;

static Zero *singleton = nil;

- (instancetype)init {
    self = [super init];
    if (self) {
        _value = 0;
        _real = self;
        _image = self;
        _height = 0;
    }
    return self;
}

+ (instancetype)zero {
    @synchronized (self) {
        if (!singleton) {
            singleton = [Zero new];
        }
    }
    return singleton;
}

- (nonnull id<SuperComplex>)add:(nonnull id<SuperComplex>)other {
    return other;
}

- (nonnull id<SuperComplex>)mul:(nonnull id<SuperComplex>)other {
    if (other.isNaN) {
        return other;
    }
    return self;
}

- (nonnull id<SuperComplex>)negate {
    return self;
}

- (nonnull id<SuperComplex>)conj {
    return self;
}

- (nonnull id<SuperComplex>)inverse {
    return [NaN nan];
}

@end
