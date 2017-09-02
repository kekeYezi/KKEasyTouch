//
//  YBTestHelperDemo.m
//  YYZPlus
//
//  Created by Daniel on 16/7/6.
//
//

#import "KKEasyTouchDemo.h"


@implementation KKEasyTouchDemo

+ (void)load {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self actions];
    });
//
}

+ (void)actions {

    [self setHelperTitle:@"login" actionBlock:^{
        NSLog(@"login");
    }];
    
    [self setHelperTitle:@"goback" actionBlock:^{
        NSLog(@"goback");
    }];
    
    [self setHelperTitle:@"close me" actionBlock:^{
        NSLog(@"close me");
    }];
    
    [self setHelperTitle:@"login" actionBlock:^{
        NSLog(@"login");
    }];
    
    [self setHelperTitle:@"goback" actionBlock:^{
        NSLog(@"goback");
    }];
    
    [self setHelperTitle:@"close me" actionBlock:^{
        NSLog(@"close me");
    }];
    
    [self setHelperTitle:@"login" actionBlock:^{
        NSLog(@"login");
    }];
    
    [self setHelperTitle:@"goback" actionBlock:^{
        NSLog(@"goback");
    }];
    
    [self setHelperTitle:@"close me" actionBlock:^{
        NSLog(@"close me");
    }];
    
    [self setActionEnd];
    
}

@end
