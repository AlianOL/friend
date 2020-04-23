//
//  LRYHTTPResponse.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/23.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN
/// 请求数据返回的状态码
typedef NS_ENUM(NSUInteger, MHHTTPResponseCode) {
    MHHTTPResponseCodeSuccess = 100 ,                     /// 请求成功
    MHHTTPResponseCodeNotLogin = 666,                     /// 用户尚未登录
    MHHTTPResponseCodeParametersVerifyFailure = 105,      /// 参数验证失败
};
@interface LRYHTTPResponse : BaseObject
/// The developer need care this data 切记：若没有数据是NSNull 而不是nil .对应于服务器json数据的 data
@property (nonatomic, readonly, strong) id parsedResult;
/// 自己服务器返回的状态码 对应于服务器json数据的 code
@property (nonatomic, readonly, assign) MHHTTPResponseCode code;
/// 自己服务器返回的信息 对应于服务器json数据的 code
@property (nonatomic, readonly, copy) NSString *msg;
// Initializes the receiver with the headers from the given response, and given the origin data and the
// given parsed model object(s).
- (instancetype)initWithResponseObject:(id)responseObject parsedResult:(id)parsedResult;
@end

NS_ASSUME_NONNULL_END
