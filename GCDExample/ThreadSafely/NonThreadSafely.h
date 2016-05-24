//
//  NonThreadSafely.h
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/24/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NonThreadSafely : NSObject
+ (NonThreadSafely *) shareInstance;

@end
