//
//  InviteTableViewCell.m
//  TruLi
//
//  Created by Jesse Tellez on 7/13/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "InviteTableViewCell.h"

@implementation InviteTableViewCell

@synthesize delegate;

- (void)awakeFromNib {
    // Initialization code
}

//- (void) buttonPressed {
//    if (delegate && [delegate respondToSelector:@selector(customCell: button1Pressed:)]) {
//        [delegate customCell:self button1Pressed:button];
//    }
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)customCell:(InviteCell *)cell button1pressed:(UIButton *)btn
{
    
}
-(void)customCell:(InviteCell *)cell button2pressed:(UIButton *)btn
{
    
}

@end
