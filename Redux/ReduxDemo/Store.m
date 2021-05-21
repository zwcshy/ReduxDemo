//
//  Store.m
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "Store.h"
#import "Reducer.h"
#import "State.h"

@implementation Store

+ (instancetype)sharedStore {
    static id _sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStore = [[self alloc] init];
    });

    return _sharedStore;
}

- (instancetype)init {
    NSArray *reducers = [Reducer reducers];
    State *initialState = [[State alloc] init];
    self = [super initWithReducers:reducers state:initialState];
    return self;
}

@end
