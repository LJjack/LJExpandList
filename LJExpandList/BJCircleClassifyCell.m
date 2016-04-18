//
//  BJCircleClassifyCell.m
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import "BJCircleClassifyCell.h"
#import "BJClassifyBtnContainerView.h"
#import "UIView+SDAutoLayout.h"
#import "BJClassifyFristBtnModel.h"

@interface BJCircleClassifyCell ()
@property (strong, nonatomic) BJClassifyBtnContainerView *btnContainerView;
@end

@implementation BJCircleClassifyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.btnContainerView];
    _btnContainerView.sd_layout
    .topEqualToView(self.contentView)
    .leftSpaceToView(self.contentView,0)
    .rightEqualToView(self.contentView);
    //***********************高度自适应cell设置步骤************************
    
    [self setupAutoHeightWithBottomView:_btnContainerView bottomMargin:8];
}

- (BJClassifyBtnContainerView *)btnContainerView {
    if (!_btnContainerView) {
        __weak typeof(self) wSeft = self;
        _btnContainerView = [[BJClassifyBtnContainerView alloc] initWithBlock:^(NSString *clickLabelText) {
            if ([wSeft.delegate respondsToSelector:@selector(circleClassifyCell:didSelectedLabelText:)]) {
                [wSeft.delegate circleClassifyCell:wSeft didSelectedLabelText:clickLabelText];
            }
        }];
        _btnContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _btnContainerView;
}
- (void)setFristBtnModels:(NSArray<BJClassifyFristBtnModel *> *)fristBtnModels {
    _fristBtnModels = fristBtnModels;
    NSMutableArray *mArray = [NSMutableArray array];
    for (BJClassifyFristBtnModel *model in fristBtnModels) {
        [mArray addObject:model.name];
    }
    _btnContainerView.labelTextsArray = mArray;
}
@end
NSString * const bj_CircleClassifyCell = @"bj_CircleClassifyCell";