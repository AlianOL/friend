//
//  FriendController.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/21.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "FriendController.h"
#import "FriendViewModel.h"
@interface FriendController ()
@property (nonatomic, readonly, strong) FriendViewModel *viewModel;
/// 选中的索引 selectedIndexPath
@property (nonatomic, readwrite, strong) NSIndexPath * selectedIndexPath;
/// 记录键盘高度
@property (nonatomic, readwrite, assign) CGFloat keyboardHeight;
@end

@implementation FriendController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"朋友圈";
    // Do any additional setup after loading the view.
}


@end
