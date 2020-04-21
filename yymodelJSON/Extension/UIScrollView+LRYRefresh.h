//
//  UIScrollView+LRYRefresh.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/21.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (LRYRefresh)
/// 添加下拉刷新控件
- (MJRefreshNormalHeader *)lry_addHeaderRefresh:(void(^)(MJRefreshNormalHeader *header))refreshingBlock;
/// 添加上拉加载控件
- (MJRefreshAutoNormalFooter *)lry_addFooterRefresh:(void(^)(MJRefreshAutoNormalFooter *footer))refreshingBlock;
@end

NS_ASSUME_NONNULL_END
