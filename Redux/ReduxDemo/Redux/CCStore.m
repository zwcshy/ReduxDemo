//
//  CCStore.m
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCStore.h"

/** 定义通知 */
NSNotificationName const kCCStateDidChangeNotification = @"CCStateDidChangeNotification";

@interface CCStore ()

/** 状态 */
@property (nonatomic, strong) id <CCState> state;
/** 分发 */
@property (nonatomic, copy) NSArray <RDXReduceBlock> *reducers;

/** 通知回调 */
@property (nonatomic, copy) CCStoreNotifationCallback callback;

/** 通知队列 */
@property (nonatomic, strong) NSNotificationQueue *notificationQueue;
/** 队列 */
@property (nonatomic, strong) dispatch_queue_t operationQueue;

@end

@implementation CCStore

#pragma mark - Public methods
- (instancetype)initWithReducers:(NSArray <RDXReduceBlock> *)reducers state:(id <CCState> )initialState {
    if (self = [super init]) {
        _reducers = [reducers copy];
        _state = initialState;
        _notificationQueue = [[NSNotificationQueue alloc] initWithNotificationCenter:[NSNotificationCenter defaultCenter]];
        _operationQueue = dispatch_queue_create("com.ccstore.operation.queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)dispatchAction:(id <CCAction> )action {
    dispatch_async(self.operationQueue, ^{
        for (RDXReduceBlock block in self.reducers) {
            block(self.state, action);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSNotification *note = [NSNotification notificationWithName:kCCStateDidChangeNotification object:self];
            [self.notificationQueue enqueueNotification:note
                                           postingStyle:NSPostASAP
                                           coalesceMask:(NSNotificationCoalescingOnName | NSNotificationCoalescingOnSender)
                                               forModes:nil];
        });
    });
}

- (id <CCState> )currentState {
    __block id <CCState> copiedState;
    dispatch_sync(self.operationQueue, ^{
        copiedState = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self.state]];
    });
    return copiedState;
}

@end
