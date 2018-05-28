//
//  DetailService.m
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "DetailService.h"
#import "DetailProtocol.h"
#import "ZYProductManager.h"
#import "DetailController.h"

@interface DetailService()<DetailProtocol>

@end

@implementation DetailService

+ (void)load {
    [ZYProductManager registerProvide:[self new] forProtocol:@protocol(DetailProtocol)];
}

- (UIViewController *)detailViewControllerWithGoodID:(NSString *)goodid goodName:(NSString *)goodName {
    
    DetailController *detailVC = [[DetailController alloc] initWithGooId:goodid goodName:goodName];
    return  detailVC;
}

@end
