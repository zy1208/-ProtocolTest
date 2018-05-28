//
//  ComfirmService.m
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ComfirmService.h"
#import "ComfirmProtocol.h"
#import "ComfirmController.h"
#import "ZYProductManager.h"

@interface ComfirmService()<ComfirmProtocol>

@end

@implementation ComfirmService

+ (void)load {
    [ZYProductManager registerProvide:[self new] forProtocol:@protocol(ComfirmProtocol)];
}

- (UIViewController *)comfirmWithGoodId:(NSString *)goodId goodName:(NSString *)goodName complete:(dispatch_block_t)complete {
    ComfirmController *comfirmVC = [[ComfirmController alloc] initWithGoodId:goodId goodName:goodName complete:complete];
    return comfirmVC;
}
@end
