//
//  CCState.h
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 实现copy协议，为了数据存储
 [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:state]]
 */

@protocol CCState <NSCoding>

@end

NS_ASSUME_NONNULL_END
