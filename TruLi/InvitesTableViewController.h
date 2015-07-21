//
//  InvitesTableViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 7/9/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "InviteTableViewCell.h"

@interface InvitesTableViewController : UITableViewController

@property (strong, nonatomic)NSMutableArray *invitesArray;
@property (nonatomic, strong)NSString *acceptedGameInvite;
@property (nonatomic)int tag;

//IBActions
- (IBAction)acceptInvite:(id)sender;
- (IBAction)declineInvite:(id)sender;


@end
