//
//  ViewController.m
//  Example
//
//  Created by WzxJiang on 16/11/10.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "ViewController.h"
#import "VisHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [VisHUD show:@"Waiting..." userInteraction:NO afterDelay:5];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
