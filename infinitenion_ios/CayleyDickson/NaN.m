//
//  NaN.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/12.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "NaN.h"

@implementation NaN

static NaN *singleton = nil;

@synthesize height = _height;
@synthesize image = _image;
@synthesize real = _real;

- (instancetype)init {
    self = [super init];
    if (self) {
        _height = 0;
        _real = self;
        _image = self;
    }
    return self;
}

+ (instancetype)nan {
    @synchronized (self) {
        if (!singleton) {
            singleton = [NaN new];
        }
    }
    return singleton;
}

- (nonnull id<SuperComplex>)add:(nonnull id<SuperComplex>)other {
    return singleton;
}

- (nonnull id<SuperComplex>)conj {
    return singleton;
}

- (nonnull id<SuperComplex>)div:(nonnull id<SuperComplex>)other {
    return singleton;
}

- (nonnull id<SuperComplex>)inverse {
    return singleton;
}

- (BOOL)isZero {
    return NO;
}

- (BOOL)isNaN {
    return YES;
}

- (nonnull id<SuperComplex>)mul:(nonnull id<SuperComplex>)other {
    return singleton;
}

- (nonnull id<SuperComplex>)negate {
    return singleton;
}

- (double)sqareAbs {
    return 0;
}

- (nonnull id<SuperComplex>)sub:(nonnull id<SuperComplex>)other {
    return singleton;
}

@end
