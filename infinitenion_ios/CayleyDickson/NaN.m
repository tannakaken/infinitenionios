//
//  NaN.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/12.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "NaN.h"

@interface NaN()
@property (nonatomic, readonly) double value;
@end

@implementation NaN

@synthesize height = _height;
@synthesize image = _image;
@synthesize real = _real;

- (instancetype)init {
    self = [super init];
    if (self) {
        _value = 0.0/0.0;
        _height = 0;
        _real = self;
        _image = self;
    }
    return self;
}

static NaN *singleton = nil;

+ (instancetype)nan {
    @synchronized (self) {
        if (!singleton) {
            singleton = [NaN new];
        }
    }
    return singleton;
}

- (nonnull id<SuperComplex>)add:(nonnull id<SuperComplex>)other {
    return self;
}

- (nonnull id<SuperComplex>)sub:(nonnull id<SuperComplex>)other {
    return self;
}

- (nonnull id<SuperComplex>)mul:(nonnull id<SuperComplex>)other {
    return self;
}

- (nonnull id<SuperComplex>)div:(nonnull id<SuperComplex>)other {
    return self;
}

- (nonnull id<SuperComplex>)negate {
    return self;
}

- (nonnull id<SuperComplex>)conj {
    return self;
}

- (nonnull id<SuperComplex>)inverse {
    return self;
}

@end
