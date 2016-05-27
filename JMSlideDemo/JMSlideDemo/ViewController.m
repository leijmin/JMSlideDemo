//
//  ViewController.m
//  JMSlideDemo
//
//  Created by lanren on 16/5/25.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import "ViewController.h"
#import "JMView.h"
@interface ViewController ()

@property (nonatomic ,strong) JMView      *jm_View;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.jm_View];
}

//懒加载
- (JMView *)jm_View
{
    if (!_jm_View) {
        _jm_View = [[JMView alloc]initWithFrame:self.view.bounds];
    }
    return _jm_View;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
