//
//  PopUpView.m
//  JMSlideDemo
//
//  Created by lanren on 16/5/26.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "PopUpView.h"

@implementation PopUpView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCloseView)];
        [self addGestureRecognizer:tap];
        
        
    }
    return self;
}

- (void)tapCloseView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(TapCloseWithView)]) {
        [self.delegate TapCloseWithView];
    }
}
@end
