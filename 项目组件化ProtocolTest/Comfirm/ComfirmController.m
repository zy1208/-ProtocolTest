//
//  ComfirmController.m
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ComfirmController.h"
#import "DetailProtocol.h"
#import "ZYProductManager.h"

@interface ComfirmController ()

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, copy) dispatch_block_t complete;

@property (nonatomic, copy) NSString *goodId;

@property (nonatomic, copy) NSString *goodName;

@end

@implementation ComfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.sureBtn];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.sureBtn.frame = CGRectMake(0, 0, 100, 100);
    self.sureBtn.center = self.view.center;
}

- (instancetype)initWithGoodId:(NSString *)goodId goodName:(NSString *)goodName complete:(dispatch_block_t)complete {

    _complete = complete;
    _goodId = goodId;
    _goodName = goodName;
    
    return self;
}

- (void)sureBtnDidClick:(UIButton *)btn {
    id<DetailProtocol> protocol = [ZYProductManager serviceProvideForProtocol:@protocol(DetailProtocol)];
    UIViewController *vc = [protocol detailViewControllerWithGoodID:_goodId goodName:_goodName];
    if (vc) {
        [self dismissViewControllerAnimated:vc completion:^{
            if (_complete) {
                _complete();
            }
        }];
    }
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"立即下单" forState:UIControlStateNormal];
        _sureBtn.backgroundColor = [UIColor blueColor];
        [_sureBtn addTarget:self action:@selector(sureBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
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
