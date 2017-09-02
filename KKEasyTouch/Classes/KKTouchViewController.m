//
//  YBTestHelperViewController.m
//  YBProjectTestHelper
//
//  Created by Daniel on 16/7/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "KKTouchViewController.h"

@interface KKTouchViewController ()

@end

@implementation KKTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clickTitleAry = [NSMutableArray array];
    self.clickActionAry = [NSMutableArray array];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginDraw) name:@"beginDraw" object:nil];

}

- (void)beginDraw {
    for (NSInteger i=0; i < self.clickTitleAry.count ; i++) {
        UIButton *tempBtn = [[UIButton alloc] initWithFrame:(CGRect){ 5 + 95 * (i % 3), 40 + 50 * (floor( i / 3)), 90, 40}];
        [tempBtn setTitle:self.clickTitleAry[i] forState:UIControlStateNormal];
        [tempBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tempBtn setBackgroundColor:[UIColor redColor]];
        tempBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [tempBtn addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
        tempBtn.tag = i;
        tempBtn.layer.cornerRadius = 5.0f;
        tempBtn.alpha = 0;
        [self.view addSubview:tempBtn];
    }
}

- (void)doAction:(id)sender {
    UIButton *btnA = (UIButton *)sender;
    dispatch_block_t tpBlcok = self.clickActionAry[btnA.tag];
    if (tpBlcok) {
        tpBlcok();
    }
}

@end
