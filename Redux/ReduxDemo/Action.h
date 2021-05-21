//
//  Action.h
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCAction.h"

extern NSString * _Nullable const kActionIdentifierIncreaseCount;
extern NSString * _Nullable const kActionIdentifierDecreaseCount;

@interface Action : NSObject <CCAction>

- (instancetype _Nullable )init NS_UNAVAILABLE;
+ (instancetype _Nullable )new NS_UNAVAILABLE;

/**
 * 创建一个action
 *
 * @param identifier 标识
 * @param payload    额外信息，有效负载信息
 * @return Newly created action object.
 */
+ (instancetype _Nullable )actionWithIdentifier:(NSString *_Nullable)identifier payload:(nullable id)payload;

/**
* 创建一个action
*
* @param identifier 标识
* @param payload    额外信息，负载
* @return Newly created action object.
*/
- (instancetype _Nullable )initWithActionIdentifier:(NSString *_Nullable)identifier payload:(nullable id)payload NS_DESIGNATED_INITIALIZER;

@end

