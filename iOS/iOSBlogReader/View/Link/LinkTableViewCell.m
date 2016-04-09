//
//  LinkTableViewCell.m
//  iOSBlogReader
//
//  Created by everettjf on 16/4/7.
//  Copyright © 2016年 everettjf. All rights reserved.
//

#import "LinkTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface LinkTableViewCell ()
{
    UIImageView *_faviconImageView;
    UILabel *_titleLabel;
    UILabel *_subTitleLabel;
}

@end

@implementation LinkTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self _setupView];
    }
    return self;
}

- (void)_setupView{
    UIView *rootView = self.contentView;
    
    _faviconImageView = [UIImageView new];
    [rootView addSubview:_faviconImageView];
    
    UIView *vcenterView = [UIView new];
    [rootView addSubview:vcenterView];
    [_faviconImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(rootView).offset(5);
        make.top.equalTo(rootView).offset(5);
        make.height.equalTo(@50);
        make.width.equalTo(@50);
    }];
    
    [vcenterView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_faviconImageView.mas_right).offset(5);
        make.right.equalTo(rootView).offset(-5);
        make.centerY.equalTo(rootView);
    }];
    
    {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 2;
        [vcenterView addSubview:_titleLabel];
        
        _subTitleLabel = [UILabel new];
        _subTitleLabel.font = [UIFont systemFontOfSize:11];
        _subTitleLabel.numberOfLines = 1;
        [vcenterView addSubview:_subTitleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(vcenterView);
            make.left.equalTo(vcenterView);
            make.right.equalTo(vcenterView);
        }];

        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_titleLabel.mas_bottom).offset(5);
            make.left.equalTo(vcenterView);
            make.right.equalTo(vcenterView);
            make.bottom.equalTo(vcenterView);
        }];
    }
}

- (void)setFavicon:(NSString *)favicon{
    [_faviconImageView sd_setImageWithURL:[NSURL URLWithString:favicon] placeholderImage:[UIImage imageNamed:@"safari"]];
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}
- (void)setSubTitle:(NSString *)subTitle{
    _subTitleLabel.text = subTitle;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    _faviconImageView.image = nil;
    _titleLabel.text = @"";
    _subTitleLabel.text = @"";
}

@end
