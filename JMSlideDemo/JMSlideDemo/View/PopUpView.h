//
//  PopUpView.h
//  JMSlideDemo
//
//  Created by lanren on 16/5/26.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapCloseWithViewDelegate <NSObject>


//轻拍后关闭View
- (void)TapCloseWithView;

@end


@interface PopUpView : UIView

/**
 *   弹出视图 标题
 */
@property (nonatomic ,strong) UILabel *title_lable;

/**
 *   弹出视图 标签按钮
 */
@property (nonatomic ,strong) UIButton *content_btn;

/**
 *   设置代理属性
 */

@property (nonatomic ,weak) id <TapCloseWithViewDelegate>delegate;






@end
