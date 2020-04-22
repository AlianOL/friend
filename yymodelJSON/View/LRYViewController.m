//
//  LRYViewController.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/21.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "LRYViewController.h"
#import "LRYTableViewModel.h"
#import <Masonry.h>
#import <MJRefresh.h>
#import "LRYMacros.h"
#import "UIScrollView+LRYRefresh.h"
@interface LRYViewController ()

@property (weak,readwrite,nonatomic)UITableView *tableView;

@property (assign,readwrite,nonatomic)UIEdgeInsets conentInset;

@property (strong,nonatomic) LRYTableViewModel *viewModel;

@end

@implementation LRYViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
- (void)setupUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:self.viewModel.style];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.contentInset = self.contentInset;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    /// 添加加载和刷新控件
    if (self.viewModel.shouldPullDownToRefresh) {
        /// 下拉刷新
        @weakify(self);
        [self.tableView lry_addHeaderRefresh:^(MJRefreshNormalHeader *header) {
            /// 加载下拉刷新的数据
            @strongify(self);
            [self tableViewDidTriggerHeaderRefresh];
        }];
        [self.tableView.mj_header beginRefreshing];
    }
    if (@available(iOS 11.0, *)) {
        /// CoderMikeHe: 适配 iPhone X + iOS 11，
        MHAdjustsScrollViewInsets_Never(tableView);
        /// iOS 11上发生tableView顶部有留白，原因是代码中只实现了heightForHeaderInSection方法，而没有实现viewForHeaderInSection方法。那样写是不规范的，只实现高度，而没有实现view，但代码这样写在iOS 11之前是没有问题的，iOS 11之后应该是由于开启了估算行高机制引起了bug。
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
    }
    
}
-(UIEdgeInsets)contentInset {
    
    return UIEdgeInsetsMake(MH_APPLICATION_TOP_BAR_HEIGHT, 0, 0, 0);
}
#pragma mark subclass can override these methods
-(void)reloadData {
    
    [self.tableView reloadData];
}
-(void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
}


#pragma mark tableView delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    id object = nil;
    if (self.viewModel.shouldMultiSections) {
        object = self.viewModel.dataSource[indexPath.section][indexPath.row];
    }else {
        object = self.viewModel.dataSource[indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel.didSelectCommand execute:indexPath];//发送消息
    
}
#pragma mark 上拉下拉刷新
/// 下拉事件
- (void)tableViewDidTriggerHeaderRefresh{
    @weakify(self)
    [[[self.viewModel.requestDataCommad
       execute:@1]
         deliverOnMainThread]
        subscribeNext:^(id x) {
            @strongify(self)
            self.viewModel.page = 1;
            /// 重置没有更多的状态
            if (self.viewModel.shouldEndRefreshingWithNoMoreData) [self.tableView.mj_footer resetNoMoreData];
        } error:^(NSError *error) {
            @strongify(self)
            /// 已经在bindViewModel中添加了对viewModel.dataSource的变化的监听来刷新数据,所以reload = NO即可
            [self.tableView.mj_header endRefreshing];
        } completed:^{
            @strongify(self)
            /// 已经在bindViewModel中添加了对viewModel.dataSource的变化的监听来刷新数据,所以只要结束刷新即可
            [self.tableView.mj_header endRefreshing];
            /// 请求完成
            [self _requestDataCompleted];
        }];
}
/// 上拉事件
- (void)tableViewDidTriggerFooterRefresh{
    @weakify(self);
    [[[self.viewModel.requestDataCommad
       execute:@(self.viewModel.page + 1)]
      deliverOnMainThread]
     subscribeNext:^(id x) {
         @strongify(self)
         self.viewModel.page += 1;
     } error:^(NSError *error) {
         @strongify(self);
         [self.tableView.mj_footer endRefreshing];
     } completed:^{
         @strongify(self)
         [self.tableView.mj_footer endRefreshing];
         /// 请求完成
         [self _requestDataCompleted];
     }];
}
#pragma mark - 辅助方法
- (void)_requestDataCompleted{
    NSUInteger count = self.viewModel.dataSource.count;
    /// CoderMikeHe Fixed: 这里必须要等到，底部控件结束刷新后，再来设置无更多数据，否则被叠加无效
    if (self.viewModel.shouldEndRefreshingWithNoMoreData && count%self.viewModel.perPage) [self.tableView.mj_footer endRefreshingWithNoMoreData];
}


@end
