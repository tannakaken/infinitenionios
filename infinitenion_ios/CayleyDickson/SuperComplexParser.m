//
//  SuperComplexParser.m
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/04/11.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#import "SuperComplexParser.h"

@implementation SuperComplexParser

- (id<SuperComplex>)parse:(NSString *)input {
    return nil;
}

@end

id<SuperComplex> SuperComplexFromString(NSString *input) {
    SuperComplexParser *parser = [SuperComplexParser new];
    return [parser parse:input];
}
