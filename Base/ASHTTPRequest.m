//
//  ASHTTPRequest.m
//  ActivitySharing
//
//  Created by sherlock on 2018/3/1.
//  Copyright © 2018年 cgy. All rights reserved.
//

#import "ASHTTPRequest.h"
@interface ASHTTPRequest ()

@property (nonatomic, class, readonly) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@implementation ASHTTPRequest

static AFHTTPSessionManager *manager = nil;

+ (AFHTTPSessionManager *)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}
- (instancetype)init {
    if (self = [super init]) {
        _fields = @{}.mutableCopy;
    }
    return self;
}

- (void)sendQuery {
    
    if ([self.HTTPType isEqualToString:@"GET"]) {
        self.task = [ASHTTPRequest.manager GET:self.method parameters:self.fields progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successOnCompletion:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failOnError:error];
        }];
    } else if ([self.HTTPType isEqualToString:@"POST"]) {
        self.task = [ASHTTPRequest.manager POST:self.method parameters:self.fields progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successOnCompletion:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failOnError:error];
        }];
    } else {
        
    }
//    ((void(*)(id, SEL, NSString *, NSString *))objc_msgSend)(self, @selector(sendQuery), @"", @"");
}

- (void)successOnCompletion:(id)responseObject {
    [self jsonConvertToModel:responseObject];
    self.onCompletion(responseObject);
    self.task = nil;
}

- (id)jsonConvertToModel:(id)json {
    if (self.model.length == 0) {
        return json;
    }
    return [NSClassFromString(self.model) yy_modelWithJSON:json];
}

- (void)failOnError:(id)error {
    self.onError(error);
    self.task = nil;
}

- (void)cancelQuery {
    [self.task cancel];
    self.task = nil;
}

- (void)dealloc {
    
}

@end
