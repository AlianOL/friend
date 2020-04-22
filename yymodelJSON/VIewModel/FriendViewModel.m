//
//  FriendViewModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "FriendViewModel.h"
#import "ReplyItemVIewModel.h"
#import "CommentModel.h"
#import "NSObject+MHExtension.h"
@interface FriendViewModel ()
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

@implementation FriendViewModel

-(void)initialize {
    [super initialize];
    @weakify(self);
    
    /// 设置tableView的样式
    self.style = UITableViewStyleGrouped;
    /// 隐藏导航栏的细线
    
    
    /// 允许下拉刷新+上拉加载
    self.shouldPullDownToRefresh = NO;
    self.shouldPullUpToLoadMore = YES;
    
    /// 显示的数据是每页八条说说
    self.perPage = 8;
    
    /// 允许多段显示
    self.shouldMultiSections = YES;
    self.shouldEndRefreshingWithNoMoreData = YES;
    
    /// 事件操作
    //// 初始化一系列subject
    self.reloadSectionSubject = [RACSubject subject];
    self.commentSubject = [RACSubject subject];
    self.phoneSubject = [RACSubject subject];
    self.commentCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(ReplyItemVIewModel * itemViewModel) {
        @strongify(self);
        //TODO:
        CommentModel *comment = [[CommentModel alloc] init];
        comment.text = itemViewModel.text;
        /// 搞个随机字符串
        comment.idstr = [NSString stringWithFormat:@"%ld",[NSObject mh_randomNumberWithFrom:10000000 to:99999999]];
        comment.momentIdstr = itemViewModel.momentIdstr;
        comment.createdAt = [NSDate date];
        comment.fromUser = self.services.client.currentUser;
        comment.toUser = itemViewModel.toUser;
        
        return [RACSignal empty];
    }];
}
@end
