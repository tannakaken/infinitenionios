//
//  SuperComplexFactory.h
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/12.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#ifndef SuperComplexFactory_h
#define SuperComplexFactory_h
#import "SuperComplex.h"
@interface SuperComplexFactory : NSObject
- (nonnull id<SuperComplex>)zero;
- (nonnull id<SuperComplex>)nan;
- (nonnull id<SuperComplex>)real:(double)real;
- (nonnull id<SuperComplex>)real:(nonnull id<SuperComplex>)real
                           image:(nonnull id<SuperComplex>)image
                          height:(NSUInteger)height;
- (nonnull id<SuperComplex>)imaginaryUnitOfNth:(NSUInteger)nth;
+ (nonnull instancetype)getInstance;
@end
#endif /* SuperComplexFactory_h */
