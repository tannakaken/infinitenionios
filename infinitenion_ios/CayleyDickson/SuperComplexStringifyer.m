//
//  CayleyDicksonStringifyingVisitor.m
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/02/23.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#import "SuperComplexStringifyer.h"
#import "math.h"

@implementation SuperComplexStringifyer

- (NSString *)stringify:(id<SuperComplex>)complex {
    return [self stringify:complex withIndex:0];
}

NSUInteger pow2(NSUInteger n) {
    return (NSUInteger)pow(2, n);
}

- (NSString *)stringify:(id<SuperComplex>)complex withIndex:(NSInteger)index {
    if (complex.height == 0) {
        if (index == 0) {
            return complex.description;
        } else {
            NSString *term = complex.description;
            if ([term isEqualToString:@"0"]) {
                return @"0";
            } else if ([term isEqualToString:@"1"]) {
                return [NSString stringWithFormat:@"E%ld", index];
            } else {
                return [NSString stringWithFormat:@"%@ E%ld *", term, index];
                
            }
        }
    } else {
        NSString *first = [self stringify:complex.real withIndex:index];
        NSString *second = [self stringify:complex.image
                                 withIndex:index
                                            + (NSInteger)pow(2, complex.height-1)];
        if ([first isEqualToString:@"0"]) {
            return second;
        }
        return [NSString stringWithFormat:@"%@ %@ +", first, second];
    }
}

@end
