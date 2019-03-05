//
//  EasyCell.m
//  OCTest
//
//  Created by xulianpeng on 2019/3/4.
//  Copyright © 2019 lianpeng. All rights reserved.
//

#import "EasyCell.h"

@implementation EasyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.newsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 80)];
        [self.contentView addSubview:self.newsImage];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 10, 200, 30)];
        self.titleLabel.backgroundColor = [UIColor yellowColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        
        
        
    }
    return self;
}
- (void)setModel:(EasyModel *)model{
    
    self.titleLabel.text = model.title;
    
}
@end
