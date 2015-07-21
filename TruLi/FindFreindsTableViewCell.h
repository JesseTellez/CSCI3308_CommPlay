//
//  FindFreindsTableViewCell.h
//  TruLi
//
//  Created by Jesse Tellez on 4/16/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ProfilePicture.h"
#import <ParseUI/ParseUI.h>

@interface FindFreindsTableViewCell : UITableViewCell


/*! These properties enable user to see other users picture, bio and user name
 within a table view cell */
@property (strong, nonatomic) IBOutlet PFImageView *FindFriendsProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *findFriendsUsername;
@property (weak, nonatomic) IBOutlet UILabel *findFriendsUserBio;
@property (strong, nonatomic) PFObject *objectd;
- (void)setProfileImage:(ProfilePicture *)Picture;
-(void)setSelected:(BOOL)selected animated:(BOOL)animated;
                         
@end
