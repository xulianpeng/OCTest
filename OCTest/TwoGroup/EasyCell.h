//
//  EasyCell.h
//  OCTest
//
//  Created by xulianpeng on 2019/3/4.
//  Copyright © 2019 lianpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface EasyCell : UITableViewCell

//var newsImage = UIImageView()
//var titleLabel = UILabel()
//var timeLabel = UILabel()
//var reviewImage = UIImageView()
//var reviewCountLabel = UILabel()
//var typeNameLabel = UILabel()

@property(nonatomic, strong)EasyModel *model;

@property(nonatomic,strong)UIImageView * newsImage;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)UIImageView * reviewImage;
@property(nonatomic,strong)UILabel * reviewCountLabel;
@property(nonatomic,strong)UILabel * typeNameLabel;


@end

NS_ASSUME_NONNULL_END
