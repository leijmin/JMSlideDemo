//
//  JMView.m
//  JMSlideDemo
//
//  Created by lanren on 16/5/25.
//  Copyright © 2016年 雷建民. All rights reserved.
//

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#import "JMView.h"
#import "PopUpView.h"
#import "JMTableViewCell.h"

@interface JMView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,TapCloseWithViewDelegate>

{
    NSInteger selectedRow;

}
@property (strong, nonatomic) JMViewModel *viewModel;


@property (nonatomic ,strong) UITableView *tableView;

@end


@implementation JMView

static CGFloat    const  itemHeightScale  = 0.42;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
         [self addSubview:self.tableView];
    }
    return self;
}


#pragma mark - delegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

  
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    JMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([JMTableViewCell class])] forIndexPath:indexPath];
    
    return cell;
}

//在willDisplayCell里面处理数据能优化tableview的滑动流畅性
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMTableViewCell *listcell = (JMTableViewCell *)cell;
    
    [listcell setDataModel:self.viewModel.dataArray[indexPath.row]];
    
    [listcell cellWithOffset];
    
}

//选中当前cell 展开view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      NSLog(@"***点击了第%ld 行cell",indexPath.row);
    
    JMTableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    selectedRow = indexPath.row;
    
    for (JMModel *model in _viewModel.dataArray) {
        
        if (model.isOpen) {
            
            model.isOpen = NO;
        }
    }
    JMModel *model = self.viewModel.dataArray[indexPath.row];
    
    model.isOpen = YES;
   
   selectedCell.popView.delegate = self;

   [selectedCell setDataModel:self.viewModel.dataArray[indexPath.row]];
  
    [tableView reloadData];
}




#pragma mark - ScrollViewDelegate --

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // visibleCells 获取界面上能显示出来了cell
    NSArray<JMTableViewCell *> *array = [self.tableView visibleCells];
    
    //enumerateObjectsUsingBlock 类似于for循环，但是比for更快
    [array enumerateObjectsUsingBlock:^(JMTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj cellWithOffset];
        
    }];
}

#pragma mark - TapCloseWithViewDelegate

- (void)TapCloseWithView
{
    JMModel *model = self.viewModel.dataArray[selectedRow];
    if (model.isOpen) {
        model.isOpen = NO;
    }
    [self.tableView reloadData];
}

// 懒加载 tableView
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
        [_tableView registerClass:[JMTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([JMTableViewCell class])]];
        _tableView.rowHeight = kScreenWidth * itemHeightScale;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate   = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (JMViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[JMViewModel alloc]init];
    }
    return _viewModel;
}
@end
