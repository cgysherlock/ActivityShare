//
//  ASLoginViewController.m
//  ActivitySharing
//
//  Created by sherlock on 2018/1/9.
//  Copyright © 2018年 cgy. All rights reserved.
//

#import "ASLoginViewController.h"

@interface ASLoginViewController ()
@property (nonatomic, strong) ASHTTPRequest *request;
@end

@implementation ASLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ASHTTPRequest *request = [[ASHTTPRequest alloc] init];
    self.request = request;
    self.request.method = @"http://127.0.0.1:7001/user/22";
    self.request.HTTPType = @"GET";
    self.request.onCompletion = ^(id result) {
        NSLog(@"%@",result);
    };
    self.request.onError = ^(id error) {
        NSLog(@"%@",error);
    };
    [self.request sendQuery];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",self.request);
}

@end
