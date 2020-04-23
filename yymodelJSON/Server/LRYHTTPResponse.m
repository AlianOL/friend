//
//  LRYHTTPResponse.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/23.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "LRYHTTPResponse.h"
#import "MHHTTPServiceConstant.h"
@interface LRYHTTPResponse ()
/// The developer need care this data
@property (nonatomic, readwrite, strong) id parsedResult;
/// 自己服务器返回的状态码
@property (nonatomic, readwrite, assign) MHHTTPResponseCode code;
/// 自己服务器返回的信息
@property (nonatomic, readwrite, copy) NSString *msg;
@end

@implementation LRYHTTPResponse
- (instancetype)initWithResponseObject:(id)responseObject parsedResult:(id)parsedResult
{
    self = [super init];
    if (self) {
        self.parsedResult = parsedResult ?:NSNull.null;
        self.code = [responseObject[MHHTTPServiceResponseCodeKey] integerValue];
        self.msg = responseObject[MHHTTPServiceResponseMsgKey];
    }
    return self;
}
@end
