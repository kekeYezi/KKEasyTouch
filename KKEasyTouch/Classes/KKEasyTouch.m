
//  Created by admin on 16/7/1.
//  Copyright (c) 2016年 Daniel. All rights reserved.

#import "KKEasyTouch.h"
#import "KKTouchViewController.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RECTNORMAL CGRectMake(0, 0, (kScreenWidth / 3.0f) * 2, (kScreenWidth / 3.0f) * 2)
#define SIZENORMAL CGSizeMake(300, 300)

@interface KKEasyTouch ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UIView *menuView;

@property (nonatomic, assign) BOOL isShowMenu;

@end

@implementation KKEasyTouch

+ (KKEasyTouch*)sharedTouch {
    static KKEasyTouch *sharedView;
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        sharedView = [[KKEasyTouch alloc] initWithFrame:CGRectMake(100, 70, 40, 40) imageName:@"KKEasyTouch.png"]; });
    return sharedView;
}

- (id)initWithFrame:(CGRect)frame imageName:(NSString *)name {
    if(self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelStatusBar + 100;
        [self makeKeyAndVisible];
        
        _iconImageView = [[UIImageView alloc]initWithFrame:(CGRect){0, 0,frame.size.width, frame.size.height}];
        _iconImageView.image = [UIImage imageNamed:name];
        _iconImageView.alpha = 1;
        _iconImageView.layer.cornerRadius = 20.0f;
        _iconImageView.layer.masksToBounds = YES;
        [self addSubview:_iconImageView ];

        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        [self addGestureRecognizer:pan];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        [self addGestureRecognizer:tap];
        
        [self creatMenu];
        self.isShowMenu=YES;
    }
    return self;
}

- (void)buttonchange {
    if (self.isShowMenu) {
        self.isShowMenu = false;
        self.menuView.frame = CGRectMake(0, 0, 0, 0);
        self.menuView.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            self.menuView.frame = CGRectMake(0, 0, SIZENORMAL.width, SIZENORMAL.height);
        } completion:^(BOOL finished) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, SIZENORMAL.width, SIZENORMAL.height);
        }];
        
        for (UIView *view in self.rootTouchViewController.view.subviews) {
            [UIView animateWithDuration:0.3 animations:^{
                view.alpha = 1;
            }];
        };
    } else {
        self.isShowMenu=true;
        [UIView animateWithDuration:0.2 animations:^{
            self.menuView.frame = CGRectMake(0, 0, 0, 0);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 44, 44);
        } completion:^(BOOL finished) {
            self.menuView.hidden = YES;
        }];
        
        for (UIView *view in self.rootTouchViewController.view.subviews) {
            [UIView animateWithDuration:0.1 animations:^{
                view.alpha = 0;
            }];
        };
    }
}

//改变位置
- (void)locationChange:(UIPanGestureRecognizer*)p {
    if(p.state == UIGestureRecognizerStateChanged) {
        self.iconImageView.alpha = 1;
    }
    
    CGPoint panPoint = [p locationInView:[[[UIApplication sharedApplication] windows] objectAtIndex:0]];

    if (!self.isShowMenu) {
            self.frame = CGRectMake(panPoint.x - 100, panPoint.y - 100, self.frame.size.width, self.frame.size.height);
    } else {
        self.frame = CGRectMake(panPoint.x, panPoint.y, self.frame.size.width, self.frame.size.height);
    }
}

//点击事件
- (void)click:(UITapGestureRecognizer*)t {
    [self buttonchange];
    [self performSelector:@selector(changeColor) withObject:nil afterDelay:0.2];
}

- (void)changeColor {
    [UIView animateWithDuration:1.0 animations:^{
        self.iconImageView.alpha = 0.3;
    }];
}

- (void)creatMenu {
    if (!_menuView) {
        _menuView = [[UIView alloc] initWithFrame:RECTNORMAL];
        _menuView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _menuView.layer.cornerRadius = 8.0f;
        _menuView.hidden = YES;
        [self addSubview:_menuView];
    }
}

+ (void)showTouch {
#if defined(DEBUG)
        [KKEasyTouch sharedTouch].rootTouchViewController = [KKTouchViewController new];
        [KKEasyTouch sharedTouch].rootViewController = [KKEasyTouch sharedTouch].rootTouchViewController;
#endif
}

+ (void)dismiss {
    //暂时隐藏，以后要开放重新打开功能
    [KKEasyTouch sharedTouch].hidden = YES;
}

@end
