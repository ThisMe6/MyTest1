//
//  ViewController.m
//  DebugDemo
//
//  Created by ice on 15/5/25.
//  Copyright (c) 2015年 ice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr=@[];
     NSString *bug=arr[1];
    NSLog(@"======%@",bug);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
