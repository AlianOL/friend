//
//  DemoModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/20.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "DemoModel.h"
#import <NSObject+YYModel.h>
@implementation DemoModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"personId":@[@"id",@"uid"],
        @"sex":@"sexDic.sex"
    };
    
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"eats":[EatModel class]
    };
}
@end

@implementation EatModel


@end
