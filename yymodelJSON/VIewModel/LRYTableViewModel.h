//
//  LRYTableViewModel.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/21.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN

@interface LRYTableViewModel : NSObject

@property (copy,readwrite,nonatomic)NSArray *dataSource;
@property (assign,readwrite,nonatomic)UITableViewStyle style;
@property (assign,readwrite,nonatomic)NSUInteger page;
@property (assign,readwrite,nonatomic)NSUInteger perPage;
@property (strong,readwrite,nonatomic)RACCommand *didSelectCommand;
@property (strong,readonly,nonatomic)RACCommand *requestDataCommad;
/// 需要支持下来刷新 defalut is NO
@property (nonatomic, readwrite, assign) BOOL shouldPullDownToRefresh;
/// 需要支持上拉加载 defalut is NO
@property (nonatomic, readwrite, assign) BOOL shouldPullUpToLoadMore;
@property (nonatomic, readwrite, assign) BOOL shouldMultiSections;
/// 是否在上拉加载后的数据,dataSource.count < pageSize 提示没有更多的数据.default is NO 默认做法是数据不够时，隐藏mj_footer
@property (nonatomic, readwrite, assign) BOOL shouldEndRefreshingWithNoMoreData;
- (id)fetchLocalData;

/// 请求错误信息过滤
- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter;

/// 当前页之前的所有数据
- (NSUInteger)offsetForPage:(NSUInteger)page;
//请求第几页的数据
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end

NS_ASSUME_NONNULL_END
