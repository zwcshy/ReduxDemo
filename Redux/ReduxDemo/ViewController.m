//
//  ViewController.m
//  ReduxDemo
//
//  Created by zwcshy on 2021/04/21.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "Action.h"
#import "State.h"

/**
 Redux是将整个应用状态存储到一个地方上称为store,里面保存着一个状态树store tree,组件可以派发(dispatch)行为(action)给store,
 而不是直接通知其他组件，组件内部通过订阅store中的状态state来刷新自己的视图。
 
 Action：把数据传到Store的有效载荷，是Store中数据的唯一来源。它有可能是来自服务器的响应，或者是用户的输入。
 Store：负责存储、管理State，分配Action给Reducer。
 State：实际上是一种数据结构，而且是只读的，唯一能改变它的地方在Reducer。
 Reducer：负责更新State的地方
 */

@interface ViewController ()

/** 增加 */
@property (nonatomic, strong) UIButton *increaseButton;
/** 减少 */
@property (nonatomic, strong) UIButton *decreaseButton;
/** 显示 */
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.increaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.increaseButton.frame = CGRectMake(30, 300, 100, 30);
    [self.increaseButton setTitle:@"增加" forState:UIControlStateNormal];
    [self.increaseButton setBackgroundColor:[UIColor orangeColor]];
    [self.increaseButton addTarget:self action:@selector(increaseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.increaseButton];
    
    self.decreaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.decreaseButton.frame = CGRectMake(230, 300, 100, 30);
    [self.decreaseButton setTitle:@"减少" forState:UIControlStateNormal];
    [self.decreaseButton setBackgroundColor:[UIColor orangeColor]];
    [self.decreaseButton addTarget:self action:@selector(decreaseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.decreaseButton];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 400, self.view.frame.size.width - 60, 30)];
    self.textLabel.textColor = [UIColor orangeColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.text = @"当前是0";
    [self.view addSubview:self.textLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI:)
                                                 name:kCCStateDidChangeNotification
                                               object:nil];
}

- (void)increaseButtonClick:(UIButton *)button {
    Action *action = [[Action alloc] initWithActionIdentifier:kActionIdentifierIncreaseCount payload:nil];
    [[Store sharedStore] dispatchAction:action];
}

- (void)decreaseButtonClick:(UIButton *)button  {
    Action *action = [[Action alloc] initWithActionIdentifier:kActionIdentifierDecreaseCount payload:nil];
    [[Store sharedStore] dispatchAction:action];
}

- (void)updateUI:(NSNotification *)note {
    State *state = (State *)[[Store sharedStore] currentState];
    self.textLabel.text = [NSString stringWithFormat:@"当前是%ld", state.count];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
