//
//  RACSignal+MHHTTPServiceAdditions.m
//  WeChat
//
//  Created by CoderMikeHe on 2017/10/19.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "RACSignal+MHHTTPServiceAdditions.h"
#import "LRYHTTPResponse.h"
@implementation RACSignal (MHHTTPServiceAdditions)

- (RACSignal *)mh_parsedResults {
    return [self map:^(LRYHTTPResponse *response) {
        NSAssert([response isKindOfClass:LRYHTTPResponse.class], @"Expected %@ to be an MHHTTPResponse.", response);
        return response.parsedResult;
    }];
}

@end
