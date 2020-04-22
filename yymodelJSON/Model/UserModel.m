//
//  UserModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"screenName"         : @"screen_name",
             @"profileImageUrl"    : @"profile_image_url",
             @"avatarLarge"        : @"avatar_large"
             };
}


/// 实现
- (BOOL)isEqual:(UserModel *)object
{
    /// 重写比对规则
    if([object isKindOfClass:[self class]])
    {
        return [self.idstr isEqualToString:object.idstr];
    }
    return [super isEqual:object];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _coverImage = MHImageNamed(@"Kris");
    }
    return self;
}
@end
