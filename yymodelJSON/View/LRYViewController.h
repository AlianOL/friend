//
//  LRYViewController.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/21.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRYViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>

@property (weak,readonly, nonatomic) UITableView *tableView;
@property (nonatomic,readonly,assign) UIEdgeInsets contentInset;

- (void)reloadData;
/// dequeueReusableCell
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

/// configure cell data
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
@end

NS_ASSUME_NONNULL_END
