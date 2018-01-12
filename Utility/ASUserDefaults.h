//
//  ASUserDefaults.h
//  ActivitySharing
//
//  Created by sherlock on 2018/1/9.
//  Copyright © 2018年 cgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASUser.h"

@interface NSUserDefaults (Subscript)

- (id)objectForKeyedSubscript:(NSString *)key;

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key;

@end

@interface ASUserDefaults : NSObject

+ (ASUser *)user;

+ (void)setUser:(ASUser *)user;

+ (id)objectForKey:(NSString *)key;

+ (void)setObject:(id)obj forKey:(NSString *)key;

@end
