//
//  DhtQueue.h
//  DhtCommonLib
//
//  Created by Nguyen Van Dung on 2/4/16.
//  Copyright © 2016 Nguyen Van Dung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DhtQueue : NSObject
- (instancetype)initWithName:(const char *)name;
+ (DhtQueue *)mainQueue;

- (dispatch_queue_t)nativeQueue;

- (bool)isCurrentQueue;
- (void)dispatchOnQueue:(dispatch_block_t)block;
- (void)dispatchOnQueue:(dispatch_block_t)block synchronous:(bool)synchronous;
@end
