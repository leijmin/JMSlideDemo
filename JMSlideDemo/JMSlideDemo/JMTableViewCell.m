//
//  JMTableViewCell.m
//  JMSlideDemo
//
//  Created by lanren on 16/5/25.
//  Copyright © 2016年 雷建民. All rights reserved.
//


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define CELLHEIGHT     kScreenWidth * 0.42

#import "JMView.h"
#import "JMTableViewCell.h"
@interface JMTableViewCell ()
{
    
    NSInteger       selectRow;

    JMTableViewCell *selectRowCell;
}
/**
 *   列表滚动图片
 */
@property (nonatomic, strong) UIImageView *listImageView;

/**
 *  列表标题
 */
@property (nonatomic, strong) UILabel *listTitle;




@end


@implementation JMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.pictureView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.popView];
    }
    return self;
}

#pragma mark - 子控件懒加载
- (UIImageView *)pictureView
{
    if (!_pictureView) {
        
        _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0,- CELLHEIGHT / 2 ,kScreenWidth ,CELLHEIGHT * 2)];
        
        _pictureView.contentMode = UIViewContentModeScaleAspectFit;
   
    }
    return _pictureView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CELLHEIGHT * 0.5 - 15, kScreenWidth, 30)];
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.textColor = [UIColor whiteColor];
        
        _titleLabel.text = @"标题";
        
    }
    return _titleLabel;
}


- (PopUpView *)popView
{
    if (!_popView) {
        
        self.popView = [[PopUpView alloc]initWithFrame:CGRectMake(0,CELLHEIGHT *0.5, self.frame.size.width, 0)];
    
        _popView.backgroundColor = [UIColor yellowColor];
    }
    return _popView;
}




- (CGFloat)cellWithOffset
{
    /*
     将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
     这里用来获取self在window上的位置
     */
    CGRect toWindow = [self convertRect:self.bounds toView:self.window];
    
    //获取父视图的中心
    CGPoint windowCenter = self.superview.center;
    
    //cell在y轴上的偏移    CGRectGetMidY 获取中心Y值
    CGFloat cellOffsetY = CGRectGetMidY(toWindow) - windowCenter.y;
    
    //位移比例
    CGFloat offsetScale = 2 * cellOffsetY / self.superview.frame.size.height ;
    
    //要补偿的偏移
    CGFloat offset =  -offsetScale * kScreenWidth * 0.1;
    
    //让pictureViewY轴方向偏移offset
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    
    //给imageView的transfrom赋值
    self.pictureView.transform = transY;
    
    return offset;
}


- (void)setDataModel:(JMModel *)dataModel
{
    self.pictureView.image = dataModel.images;
    
    //当 isOpen 为YES 把View展开  否则关闭
    if (dataModel.isOpen) {
        
        if (self.popView.frame.size.height == 0) {
            [UIView animateWithDuration:0.3 animations:^{
                self.popView.frame = CGRectMake(0, 0, kScreenWidth, CELLHEIGHT);
                
            }];
        }
    } else {
        
        [UIView animateWithDuration:0.3 animations:^{
           
            self.popView.frame = CGRectMake(0, CELLHEIGHT * 0.5, kScreenWidth,0);
            
        }];
        
    }
}




@end
