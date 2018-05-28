//
//  DetailController.m
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "DetailController.h"
#import "ComfirmController.h"
#import "ZYProductManager.h"
#import "ComfirmProtocol.h"

@interface DetailController ()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIButton *comfirmBtn;

@property (nonatomic, copy) NSString *goodId;

@property (nonatomic, copy) NSString *goodName;

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.comfirmBtn];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.nameLabel.frame = CGRectMake(0, 0, 200, 100);
    self.nameLabel.center = self.view.center;
    
    self.comfirmBtn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 45, [UIScreen mainScreen].bounds.size.width, 45);
}

- (instancetype)initWithGooId:(NSString *)goodId goodName:(NSString *)goodName {

    self.goodId = goodId;
    self.goodName = goodName;
    
    return self;
}

- (void)comfirmBtnDidClick:(UIButton *)btn {
    id<ComfirmProtocol> protocol = [ZYProductManager serviceProvideForProtocol:@protocol(ComfirmProtocol)];
    UIViewController *vc = [protocol comfirmWithGoodId:self.goodId goodName:self.goodName complete:^{
        self.nameLabel.text = @"购买成功";
    }];
    
    if (vc) {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor yellowColor];
        _nameLabel.text = @"暂未购买";
    }
    return _nameLabel;
}

- (UIButton *)comfirmBtn {
    if (!_comfirmBtn) {
        _comfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _comfirmBtn.backgroundColor = [UIColor redColor];
        [_comfirmBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_comfirmBtn addTarget:self action:@selector(comfirmBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _comfirmBtn;
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
