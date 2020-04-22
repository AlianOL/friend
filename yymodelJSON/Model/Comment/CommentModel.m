//
//  CommentModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"createdAt"        : @"created_at",
             @"momentIdstr"      : @"moment_idstr",
             @"toUser"           : @"to_user",
             @"fromUser"         : @"from_user"
             };
}
@end
