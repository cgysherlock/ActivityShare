//
//  ASUserDefaults.m
//  ActivitySharing
//
//  Created by sherlock on 2018/1/9.
//  Copyright © 2018年 cgy. All rights reserved.
//

#import "ASUserDefaults.h"

static NSString * const userKey = @"userKey";

@implementation NSUserDefaults (Subscript)

- (id)objectForKeyedSubscript:(NSString *)key {
    return [self objectForKey:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key {
    [self setObject:obj forKey:key];
}

@end

@implementation ASUserDefaults

+ (ASUser *)user {
    ASUser *user = [NSUserDefaults standardUserDefaults][userKey];
    return user;
}

+ (void)setUser:(ASUser *)user {
    [NSUserDefaults standardUserDefaults][userKey] = user;
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)key {
    return [NSUserDefaults standardUserDefaults][key];
}

+ (void)setObject:(id)obj forKey:(NSString *)key {
    [NSUserDefaults standardUserDefaults][key] = obj;
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
