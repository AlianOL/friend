//
//  CommentModel.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommentModel : NSObject
/// 正文
@property (nonatomic, readwrite, copy) NSString *text;
/// idStr(评论的id)
@property (nonatomic, readwrite, copy) NSString *idstr;
/// momentIdstr(该评论的所处的说说的id)
@property (nonatomic, readwrite, copy) NSString *momentIdstr;
/// 创建时间
@property (nonatomic, readwrite, strong) NSDate *createdAt;
/// 回复:xxx （目标）
@property (nonatomic, readwrite, strong) UserModel *toUser;
/// xxx: （来源）
@property (nonatomic, readwrite, strong) UserModel *fromUser;

@end

NS_ASSUME_NONNULL_END
