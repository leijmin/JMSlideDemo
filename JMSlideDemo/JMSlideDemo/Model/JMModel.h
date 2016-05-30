//
//  JMModel.h
//  JMSlideDemo
//
//  Created by lanren on 16/5/25.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMModel : NSObject

/**
 *    布尔属性 tableViewCell是否展开
 */
@property (nonatomic, assign) BOOL     isOpen;

/**
 *    该界面是本地图片非网络请求
 */
@property (nonatomic, strong) UIImage  *images;

@end
