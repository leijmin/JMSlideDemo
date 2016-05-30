//
//  JMTableViewCell.h
//  JMSlideDemo
//
//  Created by lanren on 16/5/25.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMModel.h"
#import "PopUpView.h"


@interface JMTableViewCell : UITableViewCell

/**
 *  图片imgView
 */
@property (nonatomic, strong) UIImageView * pictureView;

/**
 *  标题label
 */
@property (nonatomic, strong) UILabel * titleLabel;

/**
 *   弹出视图
 */

@property (nonatomic, strong) PopUpView *popView;

//cell的位移
- (CGFloat)cellWithOffset;


- (void)setDataModel:(JMModel *)dataModel;

@end
