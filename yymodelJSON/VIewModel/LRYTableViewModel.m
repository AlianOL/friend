//
//  LRYTableViewModel.m
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/21.
//  Copyright © 2020 6renyou. All rights reserved.
//

#import "LRYTableViewModel.h"

@interface LRYTableViewModel ()

@property (strong,readwrite,nonatomic)RACCommand *requestDataCommad;

@end

@implementation LRYTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.perPage = 20;
        /// request remote data
        @weakify(self)
        self.requestDataCommad = [[RACCommand alloc] initWithSignalBlock:^(NSNumber *page) {
            @strongify(self)
            return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
        }];
        
    }
    return self;
}


-(BOOL (^)(NSError * _Nonnull))requestRemoteDataErrorsFilter {
    return ^(NSError *error){
        return YES;
    };
}
-(id)fetchLocalData {
    return nil;
}
-(NSUInteger)offsetForPage:(NSUInteger)page {
    return (page-1)*self.perPage;
}

@end
