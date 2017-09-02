//
//  KKEasyTouchActions.h
//  Pods
//
//  Created by Daniel on 2017/8/11.
//
//

#import <Foundation/Foundation.h>

@interface KKEasyTouchActions : NSObject

+ (void)actions;

/**
 *  添加快捷操作API
 *
 *  @param title 操作名
 *  @param block 操作block代码
 */
+ (void)setHelperTitle:(NSString *)title actionBlock:(dispatch_block_t)block;

+ (void)setActionEnd;

@end
