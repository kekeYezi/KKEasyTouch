
//
//  Created by admin on 16/7/1.
//  Copyright (c) 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自定义的window 在最上层
 */
@class KKTouchViewController;

@interface KKEasyTouch : UIWindow

@property (nonatomic, strong) KKTouchViewController *rootTouchViewController;

+ (KKEasyTouch *)sharedTouch;

/**
 *  启动Touch
 */
+ (void)showTouch;

/**
 *  让球消失
 */
+ (void)dismiss;

@end
