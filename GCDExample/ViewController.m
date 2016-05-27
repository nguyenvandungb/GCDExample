//
//  ViewController.m
//  GCDExample
//
//  Created by Nguyen Van Dung on 5/24/16.
//  Copyright © 2016 Dht. All rights reserved.
//

#import "ViewController.h"
#import "RaceCondition.h"

@interface ViewController ()
@property (nonatomic, strong) RaceCondition *raceCondition;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _raceCondition = [[RaceCondition alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)testAction:(id)sender {
    [_raceCondition reset];
    [_raceCondition raceConditionTestOnDifferentQueue];
}

@end
