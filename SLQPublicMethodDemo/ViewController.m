//
//  ViewController.m
//  SLQPublicMethodDemo
//
//  Created by Christian on 16/8/31.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "ViewController.h"
#import "SLQPublicMethod.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (![SLQPublicMethod checkNumber:@"dd22"]) {
        NSLog(@"不是数字");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
