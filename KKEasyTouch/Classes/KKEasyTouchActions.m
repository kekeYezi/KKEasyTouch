//
//  KKEasyTouchActions.m
//  Pods
//
//  Created by Daniel on 2017/8/11.
//
//

#import "KKEasyTouchActions.h"
#import "KKTouchViewController.h"
#import "KKEasyTouch.h"

@implementation KKEasyTouchActions

+ (void)actions {
    
}

+ (void)setHelperTitle:(NSString *)title actionBlock:(dispatch_block_t)block{
    [[KKEasyTouch sharedTouch].rootTouchViewController.clickTitleAry addObject:title];
    [[KKEasyTouch sharedTouch].rootTouchViewController.clickActionAry addObject:block];
}

+ (void)setActionEnd {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beginDraw" object:nil];
}

@end
