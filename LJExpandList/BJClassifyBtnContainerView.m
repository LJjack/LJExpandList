//
//  BJClassifyBtnContainerView.m
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import "BJClassifyBtnContainerView.h"
#import "UIView+SDAutoLayout.h"

@interface BJClassifyBtnContainerView ()
@property (strong, nonatomic) NSArray *labelViewsArray;
@property (assign, nonatomic) CGFloat margin;
@property (copy, nonatomic) BJClassifyBtnContainerViewBlock block;
@end


@implementation BJClassifyBtnContainerView

- (instancetype)initWithBlock:(BJClassifyBtnContainerViewBlock) block {
    if (self = [super init]) {
        _block = block;
        [self setup];
    }
    return self;
}


- (void)setup
{
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        label.textColor = [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:14.];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.userInteractionEnabled = YES;
        label.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [label addGestureRecognizer:tap];
        [temp addObject:label];
    }
    
    self.labelViewsArray = [temp copy];
}


- (void)setLabelTextsArray:(NSArray *)labelTextsArray
{
    _labelTextsArray = labelTextsArray;
    if (!_margin) {
        _margin = 1.;
    }
    
    for (long i = _labelTextsArray.count; i < self.labelViewsArray.count; i++) {
        UILabel *label = [self.labelViewsArray objectAtIndex:i];
        label.hidden = YES;
    }
    
    if (_labelTextsArray.count == 0) {
        self.height = 0;
        self.fixedHeight = @(0);
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_labelTextsArray];
    CGFloat itemH = 50.;
    
    long perRowItemCount = [self perRowItemCountForPicPathArray:_labelTextsArray];
    CGFloat margin = _margin;
    
    [_labelTextsArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        long columnIndex = idx % perRowItemCount;
        long rowIndex = idx / perRowItemCount;
        UILabel *imageView = [_labelViewsArray objectAtIndex:idx];
        imageView.hidden = NO;
        imageView.text = obj;
        imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
    }];
    
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(_labelTextsArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    self.width = w;
    self.height = h;
    
    self.fixedHeight = @(h);
    self.fixedWidth = @(w);
}

#pragma mark - private actions

- (void)tapLabel:(UITapGestureRecognizer *)tap
{
    if (_block) {
        _block(self.labelTextsArray[tap.view.tag]);
    }
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 *  _margin) / 3. + 0.5f;
    if (array.count == 1) {
        width = 2.3f * width;
    }
    return width;
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count <= 4) {
        return 2;
    } else {
        return 3;
    }
}

@end
