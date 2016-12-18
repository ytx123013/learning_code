//
//  ViewController.m
//  Concurrency
//
//  Created by aa on 16/11/16.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "ViewController.h"
#import "OperationManager.h"
#import "DispatchQueueManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
//    [[OperationManager sharedManager] testBasicConcurrencyQueue];
    
//    [[OperationManager sharedManager] testDenpendencyQueue];

}

- (IBAction)print:(id)sender
{
//    [[OperationManager sharedManager] printBasicConcurrencyQueueInfo];
    [[OperationManager sharedManager] printDenpendencyConcurrencyQueueInfo];
}

- (IBAction)stop:(id)sender
{
    [[OperationManager sharedManager] cancelBasicConcurrencyQueue];
}

- (IBAction)simpleGCDConcurrency:(id)sender
{
    [[DispatchQueueManager sharedManager] simpleConcurrencyTest];
}

- (IBAction)simpleGCDSerial:(id)sender
{
    [[DispatchQueueManager sharedManager] simpleSerialTest];
}

- (IBAction)iterationTest:(id)sender
{
    [[DispatchQueueManager sharedManager] iterationTest];
}

- (IBAction)gcdSuspend:(id)sender
{
    [[DispatchQueueManager sharedManager] gcdSuspend];
}

- (IBAction)gcdResume:(id)sender
{
    [[DispatchQueueManager sharedManager] gcdResumed];
}

- (IBAction)gcdGroupWait:(id)sender
{
    [[DispatchQueueManager sharedManager] gcdGroupWait];
}

- (IBAction)gcdSemaphoreLock:(id)sender
{
    [[DispatchQueueManager sharedManager] gcdSemaphoreLock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
