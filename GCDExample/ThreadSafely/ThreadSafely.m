//
//  ThreadSafely.m
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/24/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import "ThreadSafely.h"
static const char *protectQueue = "com.techShow.itemsQueueProtect";

@interface ThreadSafely()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) dispatch_queue_t itemsQueue;
@property (nonatomic, strong) dispatch_queue_t protectQueue;
@end

@implementation ThreadSafely

/*
 Note: dispatch_once make sure create expected singleton instance. 
 But: shared instance is thread safe but do not make this class thread safe.
 */
+ (ThreadSafely *) shareInstance {
    static ThreadSafely *instance = nil;
    static dispatch_once_t onceToken;
    //dispatch_one execute a block only once in a thread safe manner.
    dispatch_once(&onceToken, ^{
        instance = [[ThreadSafely alloc] init];
        NSLog(@"%s => instance  address: %@ ",__PRETTY_FUNCTION__, instance);
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _itemsQueue = dispatch_queue_create("com.techShow.itemsQueue", DISPATCH_QUEUE_CONCURRENT);
        _protectQueue = dispatch_queue_create("protectQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)removeItemInProtectQueue:(NSString *)item {
    dispatch_async(self.protectQueue, ^{
        if ([_items containsObject:item]) {
            [_items removeObject:item];
        }
    });
}

- (void)addItemInProtectQueue:(NSString *)item {
    dispatch_async(self.protectQueue, ^{
        [_items addObject:item];
    });
}

- (NSArray *)getItemsInProtectQueue {
    __block NSArray *result;
    dispatch_sync(self.protectQueue, ^{
        result = [NSArray arrayWithArray:_items];
    });
    return result;
}

- (void)addItem:(NSString *)item {
    if (item) {
        dispatch_barrier_async(self.itemsQueue, ^{
            [_items addObject:item];
        });
    }
}

- (NSArray *)getItems {
    __block NSArray *result;
    dispatch_sync(self.itemsQueue, ^{
        result = [NSArray arrayWithArray:_items];
    });
    return result;
}
@end
