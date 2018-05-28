//
//  Manager.h
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYProductManager : NSObject

+ (void)registerProvide:(id)provide forProtocol:(Protocol *)protocol;

+ (id)serviceProvideForProtocol:(Protocol *)protocol;

@end
