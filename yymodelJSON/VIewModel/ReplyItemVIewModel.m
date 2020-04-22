//
//  ReplyItemVIewModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "ReplyItemVIewModel.h"
#import "UserModel.h"
@interface ReplyItemVIewModel ()
/// 传进来的itemViewModel
@property (nonatomic, readwrite, strong) id itemViewModel;
/// idStr(评论的id)
@property (nonatomic, readwrite, copy) NSString *idstr;
/// momentIdstr(该评论的所处的说说的id)
@property (nonatomic, readwrite, copy) NSString *momentIdstr;
/// 回复:xxx （目标）
@property (nonatomic, readwrite, strong) UserModel *toUser;
/** 是否是 回复:xxx （目标） */
@property (nonatomic, readwrite, assign , getter = isReply) BOOL reply;

@end

@implementation ReplyItemVIewModel

@end
