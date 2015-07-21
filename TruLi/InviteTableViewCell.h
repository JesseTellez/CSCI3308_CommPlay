//
//  InviteTableViewCell.h
//  TruLi
//
//  Created by Jesse Tellez on 7/13/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InviteCell;
@protocol InviteCellDelegate

-(void)customCell:(InviteCell *)cell button1pressed:(UIButton *)btn;
-(void)customCell:(InviteCell *)cell button2pressed:(UIButton *)btn;

@end

@interface InviteTableViewCell : UITableViewCell {
    id<InviteCellDelegate>delegate1;
}

@property (nonatomic, assign)id<InviteCellDelegate>delegate;

//IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *senderName;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

//IBActions
- (IBAction)acceptedInvite:(id)sender;
- (IBAction)inviteDeclined:(id)sender;

@end
