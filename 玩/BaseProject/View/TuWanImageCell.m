//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
        
    }
    return _titleLb;
}

- (UILabel *)clicksNumLb {
    if(_clicksNumLb == nil) {
        _clicksNumLb = [[UILabel alloc] init];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
    }
    return _clicksNumLb;
}

- (TRImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[TRImageView alloc] init];
        
    }
    return _iconIV0;
}

- (TRImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TRImageView alloc] init];
       
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TRImageView alloc] init];
        
    }
    return _iconIV2;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clicksNumLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
    //题目:左,上 10.右10
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clicksNumLb.mas_left).mas_equalTo(-10);
        }];
    //点击数:右,上10. 左10
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            //不能合写
            make.width.mas_lessThanOrEqualTo(70);
            make.width.mas_greaterThanOrEqualTo(40);
        }];
    //图片1:宽高相等,间距5,边缘10,高度88,上边缘5
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
        }];
    //图片2
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
    //图片3
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.topMargin.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
    
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
