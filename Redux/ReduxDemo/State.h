//
//  State.h
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCState.h"

@interface State : NSObject<CCState>

@property (nonatomic, assign) NSInteger count;

@end
