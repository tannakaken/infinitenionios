//
//  CayleyDicksonStringifyingVisitor.h
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/02/23.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#ifndef CayleyDicksonStringifyingVisitor_h
#define CayleyDicksonStringifyingVisitor_h
#import "SuperComplex.h"
@interface CayleyDicksonStringifyer : NSObject
- (NSString *)stringify:(id<SuperComplex>)complex;
@end

#endif /* CayleyDicksonStringifyingVisitor_h */
