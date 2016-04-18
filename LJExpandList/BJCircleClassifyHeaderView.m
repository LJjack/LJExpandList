//
//  BJCircleClassifyHeaderView.m
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import "BJCircleClassifyHeaderView.h"
#import "SDAutoLayout/UIView+SDAutoLayout.h"

#define kCircleClassifyHeaderViewBtnColor [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0]
#define kCircleClassifyHeaderViewBtnSize 16.
@interface BJCircleClassifyHeaderViewBtn : UIButton

@end
@implementation BJCircleClassifyHeaderViewBtn

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    BJCircleClassifyHeaderViewBtn *btn = [super buttonWithType:buttonType];
    [btn setTitleColor:kCircleClassifyHeaderViewBtnColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"circle_classify_down"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:kCircleClassifyHeaderViewBtnSize];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    return btn;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat y = CGRectGetMidY(contentRect) - 16*0.5;
    CGFloat x = CGRectGetWidth(contentRect) - 16 - 12;
    return CGRectMake(x, y, 16, 16);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat width =  CGRectGetWidth(contentRect) - 14.;
    CGFloat height = CGRectGetHeight(contentRect);
    return CGRectMake(14., 0, width, height);
}

@end


@interface BJCircleClassifyHeaderView()
{
    headerBlock _block;
}
@property(nonatomic ,strong) BJCircleClassifyHeaderViewBtn *button;
@end
@implementation BJCircleClassifyHeaderView

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    // 设置渐变颜色
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    // 增加按钮
    [self.contentView addSubview:self.button];
    _button.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.alpha = 0.5;
    [self.contentView addSubview:lineView];
    lineView.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .heightIs(1);
}


- (void)clickButton {
    _block(self);
}
- (void)headerClick:(headerBlock)block {
    _block = block;
    
}
- (void)setIsOpen:(BOOL)isOpen {
    _isOpen = isOpen;
    CGFloat angle = isOpen?M_PI_2:0;
    [UIView animateWithDuration:0.5f animations:^{
        [self.button.imageView setTransform:CGAffineTransformMakeRotation(angle)];
    }];
}
- (BJCircleClassifyHeaderViewBtn *)button {
    if (!_button) {
        BJCircleClassifyHeaderViewBtn *button = [BJCircleClassifyHeaderViewBtn buttonWithType:UIButtonTypeCustom];
        // 设置按钮的图片
        [button setTitle:@"朋友！" forState:UIControlStateNormal];
        // 设置按钮内容的显示位置
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        
        // 给按钮添加监听事件
        [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        _button = button;
    }
    return _button;
}
- (void)setBtnTitle:(NSString *)btnTitle {
    _btnTitle = btnTitle;
    [_button setTitle:btnTitle forState:UIControlStateNormal];
}
@end
NSString * const bj_CircleClassifyHeaderView = @"bj_CircleClassifyHeaderView";


