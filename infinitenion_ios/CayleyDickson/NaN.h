//
//  NaN.h
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/12.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#ifndef NaN_h
#define NaN_h
#import "SuperComplex.h"
@interface NaN : NSObject<SuperComplex>
+ (instancetype)nan;
@end
#endif /* NaN_h */
