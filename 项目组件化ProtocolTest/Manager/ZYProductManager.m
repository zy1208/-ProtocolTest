//
//  Manager.m
//  项目组件化ProtocolTest
//
//  Created by Palm on 2018/3/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ZYProductManager.h"

@interface ZYProductManager()

@property (nonatomic, strong) NSMutableDictionary *serviceSource;

@end

@implementation ZYProductManager

+ (ZYProductManager *)shareManager {
    static ZYProductManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _serviceSource = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (void)registerProvide:(id)provide forProtocol:(Protocol *)protocol {
    if ((provide == nil) || (protocol == nil)) {
        return;
    }
    [[self shareManager].serviceSource setObject:provide forKey:NSStringFromProtocol(protocol)];
}

+ (id)serviceProvideForProtocol:(Protocol *)protocol {
    return [[self shareManager].serviceSource objectForKey:NSStringFromProtocol(protocol)];
}

@end

