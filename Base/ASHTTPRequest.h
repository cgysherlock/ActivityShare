//
//  ASHTTPRequest.h
//  ActivitySharing
//
//  Created by sherlock on 2018/3/1.
//  Copyright © 2018年 cgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "YYModel.h"

@interface ASHTTPRequest : NSObject

@property (nonatomic, copy) NSString *HTTPType;
@property (nonatomic, strong) NSMutableDictionary *fields;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSString *model;

@property (nonatomic, copy) void(^onCompletion)(id result);
@property (nonatomic, copy) void(^onError)(id error);

- (void)sendQuery;
- (void)cancelQuery;

@end
