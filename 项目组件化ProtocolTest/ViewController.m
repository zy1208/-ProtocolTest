//
//  ViewController.m
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ViewController.h"
#import "DetailProtocol.h"
#import "ZYProductManager.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试";
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(100, 100, 100, 100);
    self.btn.backgroundColor = [UIColor orangeColor];
    [self.btn setTitle:@"测试" forState:UIControlStateNormal];
    [self.view addSubview:self.btn];
    
    [self.btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnDidClick:(UIButton *)btn {
    id<DetailProtocol> protocol = [ZYProductManager serviceProvideForProtocol:@protocol(DetailProtocol)];
    UIViewController *vc = [protocol detailViewControllerWithGoodID:@"哈哈" goodName:@"哈哈哈哈"];
    if (vc) {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
