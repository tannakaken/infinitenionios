//
//  SuperComplex.h
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SuperComplex<NSObject>
@property (nonatomic, readonly) id<SuperComplex> real;
@property (nonatomic, readonly) id<SuperComplex> image;
@property (nonatomic, readonly) NSUInteger height;

- (id<SuperComplex>)add:(id<SuperComplex>)other;
- (id<SuperComplex>)sub:(id<SuperComplex>)other;
- (id<SuperComplex>)mul:(id<SuperComplex>)other;
- (id<SuperComplex>)div:(id<SuperComplex>)other;
- (id<SuperComplex>)negate;
- (id<SuperComplex>)conj;
- (id<SuperComplex>)inverse;
- (double)sqareAbs;
- (BOOL)isZero;
- (BOOL)isNaN;
- (double)realReal;
@end

id<SuperComplex> SuperComplexFromString(NSString *input);

NS_ASSUME_NONNULL_END
