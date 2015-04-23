//
//  FindFreindsTableViewCell.h
//  TruLi
//
//  Created by Jesse Tellez on 4/16/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindFreindsTableViewCell : UITableViewCell

/*! These properties enable user to see other users picture, bio and user name
 within a table view cell */
@property (weak, nonatomic) IBOutlet UIImageView *FindFriendsProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *findFriendsUsername;
@property (weak, nonatomic) IBOutlet UILabel *findFriendsUserBio;

@end
