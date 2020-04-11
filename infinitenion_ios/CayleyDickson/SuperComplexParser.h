//
//  SuperComplexParser.h
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/04/11.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#ifndef SuperComplexParser_h
#define SuperComplexParser_h
#import <Foundation/Foundation.h>
#import "SuperComplex.h"
@interface SuperComplexParser : NSObject
- (id<SuperComplex>)parse:(NSString *)input;
@end

#endif /* SuperComplexParser_h */
