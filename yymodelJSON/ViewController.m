//
//  ViewController.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/20.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "ViewController.h"
#import "YYModel.h"
#import "DemoModel.h"
#import <RACSignal.h>
#import <ReactiveObjC.h>
#import <NSObject+YYModel.h>
#import "FriendController.h"
#import <AFNetworking.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *tapBtn;
@property (weak, nonatomic) IBOutlet UITextField *myTextfield;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.navigationItem.title = @"首页";
    [super viewDidLoad];
    
    [self setupUI];
//    [self test];
//    [self setupTimer];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSDictionary *dic = @{
      @"name":@"张三",
      @"age":@(12),
      @"id":@"123",
      @"sexDic":@{@"sex":@"男"},
      @"languages":@[
              @"汉语",@"英语",@"法语"
              ],
      @"job":@{
              @"work":@"iOS开发",
              @"eveDay":@"10小时",
              @"site":@"软件园"
              },
      @"eats":@[
              @{@"food":@"西瓜",@"date":@"8点"},
              @{@"food":@"烤鸭",@"date":@"14点"},
              @{@"food":@"西餐",@"date":@"20点"}
              ]
    };
    DemoModel *model = [DemoModel yy_modelWithDictionary:dic];
    NSLog(@"%@",model);
}
- (void)test {
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
        [subscriber sendNext:@"hello world"];
        return [RACDisposable disposableWithBlock:^{
            
        }];
        
    }];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收到了数据%@",x);
    }];
}
- (void)setupUI {
    [[self.tapBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
       
        FriendController *firendVC = [[FriendController alloc] init];
        
        [self.navigationController pushViewController:firendVC animated:YES];
     

    }];
    [[self.myTextfield.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        NSLog(@"输入了内容%@",value);
        return value;
        
    }] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"这里内容：%@",x);
    }];
}
- (void)setupTimer {
    [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
            
        NSLog(@"当前执行到%@",x);
    }];
    [[RACSignal interval:2 onScheduler:[RACScheduler schedulerWithPriority:(RACSchedulerPriorityHigh)name:@"lsd"]] subscribeNext:^(NSDate * _Nullable x) {
            
        NSLog(@"2秒执行一次：%@",x);
    }];
}

@end
