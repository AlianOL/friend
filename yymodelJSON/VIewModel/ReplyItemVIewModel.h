//
//  ReplyItemVIewModel.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "UserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ReplyItemVIewModel : NSObject
/// 传进来的itemViewModel
@property (nonatomic, readonly, strong) id itemViewModel;
/// idStr(评论的id)
@property (nonatomic, readonly, copy) NSString *idstr;
/// momentIdstr(该评论的所处的说说的id)
@property (nonatomic, readonly, copy) NSString *momentIdstr;
/// 回复:xxx （目标）
@property (nonatomic, readonly, strong) UserModel *toUser;
/** 是否是 回复:xxx （目标） */
@property (nonatomic, readonly, assign , getter = isReply) BOOL reply;
/// 记录Section
@property (nonatomic, readwrite, assign) NSInteger section;
/// 发送评论内容
@property (nonatomic, readwrite, strong) RACCommand *commentCommand;

/// text (输入款输入的内容)
@property (nonatomic, readwrite, copy) NSString *text;


//// 初始化 （Router）
/// - itemViewModel : `MHMomentItemViewModel` 或者 `MHMomentCommentItemViewModel`
- (instancetype)initWithItemViewModel:(id)itemViewModel;
@end

NS_ASSUME_NONNULL_END
