//
//  SuperComplexParser.m
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/04/11.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#import "SuperComplexFactory.h"
@interface SuperComplexParser : NSObject
- (id<SuperComplex>)parse:(NSString *)input;
@property NSString *restOfInput;
@property NSMutableArray<id<SuperComplex>> *stack;
@end

@implementation SuperComplexParser
- (instancetype)init {
    self = [super init];
    if (self) {
        self.stack = [NSMutableArray new];
    }
    return self;
}

- (id<SuperComplex>)parse:(NSString *)input {
    if ([input isEqualToString:@"nan"]) {
        return [SuperComplexFactory.getInstance nan];
    }
    self.restOfInput = input;
    while (self.restOfInput.length > 0) {
        if (self.restOfInput == nil) {
            return nil;
        }
        [self cutoutToken];
    }
    if (self.stack == nil) {
        return nil;
    }
    if (self.stack.count != 1) {
        return nil;
    }
    return self.stack.firstObject;
}

- (unichar)head {
    if (self.restOfInput.length > 0) {
        return [self.restOfInput characterAtIndex:0];
    }
    return 0;
}

- (unichar)next {
    if (self.restOfInput.length > 1) {
        return [self.restOfInput characterAtIndex:1];
    }
    return 0;
}

- (void)step {
    if (self.restOfInput.length > 0) {
        self.restOfInput = [self.restOfInput substringFromIndex:1];
    }
}

- (void)jumpSpace {
    if (self.head == ' ') {
        [self step];
        [self jumpSpace];
    }
}

- (void)cutoutToken {
    [self jumpSpace];
    switch (self.head) {
        case '+': {
            if ('0' <= self.next && self.next <= '9') {
                [self cutoutReal];
                return;
            }
            id<SuperComplex> last = [self pop];
            id<SuperComplex> penulutimate = [self pop];
            [self.stack addObject:[penulutimate add:last]];
            [self step];
            return;
        }
        case '-': {
            if ('0' <= self.next && self.next <= '9') {
                [self cutoutReal];
                return;
            }
            id<SuperComplex> last = [self pop];
            id<SuperComplex> penulutimate = [self pop];
            [self.stack addObject:[penulutimate sub:last]];
            [self step];
            return;
        }
        case '*': {
            id<SuperComplex> last = [self pop];
            id<SuperComplex> penulutimate = [self pop];
            [self.stack addObject:[penulutimate mul:last]];
            [self step];
            return;
        }
        case '/': {
            id<SuperComplex> last = [self pop];
            id<SuperComplex> penulutimate = [self pop];
            [self.stack addObject:[penulutimate div:last]];
            [self step];
            return;
        }
        case 'E': {
            [self step];
            [self cutoutImaginaryUnit:@""];
            return;
        }
        default:
            [self cutoutReal];
            return;
    }
}

- (id<SuperComplex>)pop {
    id<SuperComplex>last = self.stack.lastObject;
    [self.stack removeLastObject];
    return last;
}

- (void)cutoutReal {
    unichar head = self.head;
    if (head == '+') {
        [self step];
        [self cutoutPositiveReal:@"" withPeriod:false];
    } else if (head == '-') {
        [self step];
        [self cutoutPositiveReal:@"" withPeriod:false];
        id<SuperComplex> last = [self pop];
        [self.stack addObject:last.negate];
    } else {
        [self cutoutPositiveReal:@"" withPeriod:false];
    }
}

- (void)cutoutPositiveReal:(NSString *)accumulate withPeriod:(BOOL)withPeriod {
    unichar head = self.head;
    if ('0' <= head && head <= '9') {
        [self step];
        [self cutoutPositiveReal:[accumulate stringByAppendingFormat:@"%C", head] withPeriod:withPeriod];
    } else if (head == '.') {
        if (withPeriod) {
            self.stack = nil;
            self.restOfInput = nil;
        } else {
            [self step];
            [self cutoutPositiveReal:[accumulate stringByAppendingString:@"."] withPeriod:true];
        }
    } else {
        if (accumulate.length == 0) {
            self.stack = nil;
            self.restOfInput = nil;
            return;
        }
        [self.stack addObject:[SuperComplexFactory.getInstance real:accumulate.doubleValue]];
    }
}

- (void)cutoutImaginaryUnit:(NSString *)accumulate {
    unichar head = self.head;
    if ('0' <= head && head <= '9') {
        [self step];
        [self cutoutImaginaryUnit:[accumulate stringByAppendingFormat:@"%C", head]];
    } else {
        if (accumulate.length == 0) {
            self.stack = nil;
            self.restOfInput = nil;
            return;
        }
        [self.stack addObject:[SuperComplexFactory.getInstance imaginaryUnitOfNth:accumulate.integerValue]];
    }
}



@end

id<SuperComplex> SuperComplexFromString(NSString *input) {
    SuperComplexParser *parser = [SuperComplexParser new];
    return [parser parse:input];
}
