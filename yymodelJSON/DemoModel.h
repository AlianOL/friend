//
//  DemoModel.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/20.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface EatModel : NSObject

@property (copy, nonatomic)NSString *food;
@property (copy, nonatomic)NSString *date;

@end
@interface DemoModel : NSObject

@property (copy,   nonatomic) NSString *name;
@property (assign, nonatomic) int age;
@property (copy,   nonatomic) NSString *sex;
@property (strong, nonatomic) NSNumber *personId;
@property (strong, nonatomic) NSDictionary *job;
@property (strong, nonatomic) NSArray *languages;
@property (strong, nonatomic) NSArray *eats;
@end

NS_ASSUME_NONNULL_END
