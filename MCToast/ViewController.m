//
//  ViewController.m
//  MCToast
//
//  Created by 常峻玮 on 16/7/3.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "ViewController.h"
#import "MCToast/MCToast.h"


@interface ViewController ()

- (IBAction)showButtonClick:(UIButton *)sender;
- (IBAction)removeButtonClick:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButtonClick:(UIButton *)sender {
    
    [MCToastManager showText:@"这是一个测试这是一个测试这是一个测试这是一个测试这是一个测试"];
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        NSLog(@"%f",window.windowLevel);
    }
}

- (IBAction)removeButtonClick:(UIButton *)sender {
//    [MCToastManager manager].window=nil;
}
@end
