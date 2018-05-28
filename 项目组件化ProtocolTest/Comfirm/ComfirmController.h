//
//  ComfirmController.h
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComfirmController : UIViewController

- (instancetype)initWithGoodId:(NSString *)goodId goodName:(NSString *)goodName complete:(dispatch_block_t)complete;

@end
