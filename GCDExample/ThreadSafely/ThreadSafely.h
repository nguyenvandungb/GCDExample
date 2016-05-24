//
//  ThreadSafely.h
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/24/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadSafely : NSObject
+ (ThreadSafely *) shareInstance;

- (void)addItem:(NSString *)item;
- (NSArray *)getItems;
- (void)addItemInProtectQueue:(NSString *)item;
- (NSArray *)getItemsInProtectQueue;
- (void)removeItemInProtectQueue:(NSString *)item;
@end
