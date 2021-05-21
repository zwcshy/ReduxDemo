//
//  CCAction.h
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CCAction <NSObject>

/** action，每个行为有唯一的标识 */
@property (nonatomic, copy, readonly) NSString *identifier;

/** 为action添加的额外信息 */
@property (nonatomic, strong, readonly, nullable) id payload;

@end

NS_ASSUME_NONNULL_END
