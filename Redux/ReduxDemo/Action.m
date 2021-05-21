//
//  Action.m
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "Action.h"

NSString * const kActionIdentifierIncreaseCount = @"ActionIdentifierIncreaseCount";
NSString * const kActionIdentifierDecreaseCount = @"ActionIdentifierDecreaseCount";

@interface Action ()

/** 标识 */
@property (nonatomic, copy, readwrite) NSString *identifier;
/** 有效负载信息 */
@property (nonatomic, strong, readwrite) id payload;

@end

@implementation Action

+ (instancetype)actionWithIdentifier:(NSString *)identifier payload:(nullable id)payload {
    return [[self alloc] initWithActionIdentifier:identifier payload:payload];
}

- (instancetype)initWithActionIdentifier:(NSString *)identifier payload:(id)payload {
    if (self = [super init]) {
        _identifier = [identifier copy];
        _payload = payload;
    }
    return self;
}

@end
