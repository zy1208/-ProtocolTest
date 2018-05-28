//
//  DetailProtocol.h
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DetailProtocol <NSObject>

- (UIViewController *)detailViewControllerWithGoodID:(NSString *)goodid goodName:(NSString *)goodName;

@end
