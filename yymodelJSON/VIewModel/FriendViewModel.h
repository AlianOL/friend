//
//  FriendViewModel.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "LRYTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendViewModel : LRYTableViewModel
/// 刷新某一个section的 事件回调
@property (nonatomic, readonly, strong) RACSubject *reloadSectionSubject;
/// 评论回调
@property (nonatomic, readonly, strong) RACSubject *commentSubject;
/// 电话号码回调
@property (nonatomic, readonly, strong) RACSubject *phoneSubject;


/// 发送评论内容
@property (nonatomic, readonly, strong) RACCommand *commentCommand;
/// 删除当前用户的评论
@property (nonatomic, readonly, strong) RACCommand *delCommentCommand;
/// 删除当前用户的发的说说
@property (nonatomic, readonly, strong) RACCommand *delMomentCommand;

/// 富文本文字上的事件处理
@property (nonatomic, readonly, strong) RACCommand *attributedTapCommand;

/// 分享view上的点击事件处理
@property (nonatomic, readonly, strong) RACCommand *shareTapCommand;
@end

NS_ASSUME_NONNULL_END
