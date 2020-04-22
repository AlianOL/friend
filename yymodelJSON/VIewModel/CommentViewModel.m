//
//  CommentViewModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "CommentViewModel.h"

@interface CommentViewModel ()
/// 刷新某一个section的 事件回调
@property (nonatomic, readwrite, strong) RACSubject *reloadSectionSubject;

/// 电话号码回调
@property (nonatomic, readwrite, strong) RACSubject *phoneSubject;

/// 评论回调
@property (nonatomic, readwrite, strong) RACSubject *commentSubject;
/// 发送评论内容
@property (nonatomic, readwrite, strong) RACCommand *commentCommand;
/// 删除当前用户的评论
@property (nonatomic, readwrite, strong) RACCommand *delCommentCommand;
/// 删除当前用户的发的说说
@property (nonatomic, readwrite, strong) RACCommand *delMomentCommand;

//// 跳转用户信息的命令
@property (nonatomic, readwrite, strong) RACCommand *profileInfoCommand;

/// 富文本文字上的事件处理
@property (nonatomic, readwrite, strong) RACCommand *attributedTapCommand;
/// 分享view上的点击事件处理
@property (nonatomic, readwrite, strong) RACCommand *shareTapCommand;

@end

@implementation CommentViewModel


- (void)initialize {
    [super initialize];
    
    
}


@end
