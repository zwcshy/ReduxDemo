//
//  CCReducer.h
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCState.h"
#import "CCAction.h"

typedef void (^RDXReduceBlock)(__kindof id <CCState> state, __kindof id <CCAction> action);

@protocol CCReducer <NSObject>

/**
 * 返回 reducer blocks 数组.
 *
 * @return RDXReduceBlock 数组
 */
+ (NSArray <RDXReduceBlock> *)reducers;

@end
