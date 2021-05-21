//
//  CCStore.h
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCState.h"
#import "CCAction.h"
#import "CCState.h"
#import "CCReducer.h"

FOUNDATION_EXPORT NSNotificationName const kCCStateDidChangeNotification;

typedef void (^CCStoreNotifationCallback)(void);

@interface CCStore : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 * 创建一个Store
 *
 * @param reducers reducers 数组
 * @param initialState 初始化状态
 * @return Store
 */
- (instancetype)initWithReducers:(NSArray <RDXReduceBlock> *)reducers state:(id <CCState> )initialState NS_DESIGNATED_INITIALIZER;

/**
 * 要求接受者发送action并立即返回
 * 接受者通过当前的state和action返回给所有的负责更新State的reduce blocks
 * 所有接收到reduce blocks的都会被触发，同时发送通知 CCStateDidChangeNotification
 * @param action The action object to be dispatched.
 */
- (void)dispatchAction:(id <CCAction> )action;

/**
 * 接受者当前状态
 *
 * @return 当前状态，这个状态经过深度copy
 */
- (id <CCState> )currentState;

@end

