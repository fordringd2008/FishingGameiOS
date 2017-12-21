//
//  ViewController.m
//  FishingGameiOS
//
//  Created by DFD on 2017/12/20.
//  Copyright © 2017年 DF. All rights reserved.
//

#import "ViewController.h"
#import "FishViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    label.center = self.view.center;
    label.text = @"点击屏幕去钓鱼🎣";
    [self.view addSubview:label];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController pushViewController:[[FishViewController alloc] init] animated:YES];
    
}


@end
