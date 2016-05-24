//
//  NonThreadSafely.m
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/24/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import "NonThreadSafely.h"

@implementation NonThreadSafely

//Want to make singleton instance but this code does not thread safe. Because with different thread
+ (NonThreadSafely *) shareInstance {
    static NonThreadSafely *instance = nil;
    if (!instance) {
        instance = [[NonThreadSafely alloc] init];
        NSLog(@"%s => instance  address: %@ ",__PRETTY_FUNCTION__, instance);
    }
    return instance;
}

@end
