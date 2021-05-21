//
//  State.m
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "State.h"

@implementation State

- (instancetype)init {
    if (self = [super init]) {
        _count = 0;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [self init]) {
        _count = [aDecoder decodeIntegerForKey:@"count"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.count forKey:@"count"];
}

@end
