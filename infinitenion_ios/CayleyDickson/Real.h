//
//  Real.h
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/06/03.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#ifndef Real_h
#define Real_h
#import "SuperComplex.h"
@interface Real : NSObject<SuperComplex>
- (instancetype)initWithReal:(double)real;
@end

#endif /* Real_h */
