//
//  RaceCondition.h
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/27/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RaceCondition : NSObject {
    
}
- (void)raceConditionTestOnSameQueue;
- (void)raceConditionTestOnDifferentQueue;
- (void)reset;
@end
