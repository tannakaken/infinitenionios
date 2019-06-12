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
- (id<SuperComplex>)zero;
- (id<SuperComplex>)nan;
- (id<SuperComplex>)real:(double *)real;
- (id<SuperComplex>)real:(id<SuperComplex>)real image:(id<SuperComplex>)image;
+ (instancetype)defaultFactory;
@end
#endif /* SuperComplexFactory_h */
