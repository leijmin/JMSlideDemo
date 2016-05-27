//
//  JMViewModel.m
//  JMSlideDemo
//
//  Created by lanren on 16/5/25.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "JMViewModel.h"

@implementation JMViewModel

- (instancetype)init
{
    if (self = [super init]) {
        [self jm_initialize];
    }
    return self;
}


- (void)jm_initialize
{
    for (int i = 0; i < 20; i++) {
        UIImage *image = [UIImage imageNamed:@"1"];
        JMModel *model = [[JMModel alloc]init];
        model.images =  image;
        model.isOpen = NO;
        [self.dataArray addObject:model];
    }
}

//懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
