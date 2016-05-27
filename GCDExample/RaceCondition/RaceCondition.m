//
//  RaceCondition.m
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/27/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import "RaceCondition.h"
#import "DhtQueue.h"

@interface RaceCondition() {
    
}
@property (nonatomic, strong) DhtQueue *queue;
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, assign) NSInteger counter;
@end

@implementation RaceCondition

- (instancetype) init {
    self = [super  init];
    if (self) {
        _value = 10;
        _queue = [[DhtQueue alloc] initWithName:"com.dungnv.test.queue"];
    }
    return self;
}

- (void)reset {
    _value = 10;
}

- (void)raceConditionTestOnSameQueue {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _value += 10;
        NSLog(@" first value = %ld",(long)_value);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _value += 10;
        NSLog(@" second value = %ld",(long)_value);
    });
}

- (void)raceConditionTestOnDifferentQueue {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _value += 10;
        NSLog(@" first value = %ld",(long)_value);
    });
    
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        _value += 10;
        NSLog(@" second value = %ld",(long)_value);
    });
}

@end
