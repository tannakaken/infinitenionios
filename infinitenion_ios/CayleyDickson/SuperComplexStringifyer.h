//
//  CayleyDicksonStringifyer.h
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/02/23.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#ifndef SuperComplexStringifyer_h
#define SuperComplexStringifyer_h
#import "SuperComplex.h"
@interface SuperComplexStringifyer : NSObject
- (NSString *)stringify:(id<SuperComplex>)complex;
@end

#endif /* SuperComplexStringifyer_h */
