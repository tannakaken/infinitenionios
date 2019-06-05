//
//  CayleyDickson.h
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#ifndef CayleyDickson_h
#define CayleyDickson_h
#import "SuperComplex.h"
@interface CayleyDickson : NSObject<SuperComplex>
- (instancetype)initWithReal:(id<SuperComplex>)real withImage:(id<SuperComplex>)image withHeight:(NSUInteger)height;
@end
#endif /* CayleyDickson_h */
