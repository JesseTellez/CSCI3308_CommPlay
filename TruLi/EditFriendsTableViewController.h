//
//  EditFriendsTableViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 3/31/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "FindFreindsTableViewCell.h"
#import "ProfilePicture.h"

@interface EditFriendsTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *allUsers;
@property (strong, nonatomic) NSArray *allUsersPictures;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSMutableArray *friends;
//@property (strong, nonatomic) FindFreindsTableViewCell *FFtableViewCell;
//@property (strong, nonatomic) ProfilePicture *userImage;
@property (strong, nonatomic) PFFile *pictureFile;


/*! isFriend checks the relation status between users */
- (BOOL)isFriend:(PFUser *)user;
- (void)getDataFromParse;
- (void)fetchData;

- (void)TableCellConfig;

@end
