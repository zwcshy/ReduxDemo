//
//  Reducer.m
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "Reducer.h"
#import "Action.h"
#import "State.h"

@implementation Reducer

+ (RDXReduceBlock)increaseReducer {
    
    RDXReduceBlock reducer = ^(State *state, Action *action) {
        if ([action.identifier isEqualToString:kActionIdentifierIncreaseCount]) {
            state.count++;
        }
    };
    return reducer;
}

+ (RDXReduceBlock)decreaseReducer {
    RDXReduceBlock reducer = ^(State *state, Action *action) {
        if ([action.identifier isEqualToString:kActionIdentifierDecreaseCount]) {
            state.count--;
        }
    };
    return reducer;
}

+ (NSArray <RDXReduceBlock> *)reducers {
    return @[
        [self increaseReducer],
        [self decreaseReducer]
    ];
}

@end
