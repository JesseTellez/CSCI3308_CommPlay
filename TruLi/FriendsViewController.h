//
//  FriendsViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "EditFriendsTableViewController.h"

#import "FindFreindsTableViewCell.h"

@interface FriendsViewController : UITableViewController
/*! A friends relation is setup to establish a many-to-many relationship between users */
@property (strong, nonatomic) PFRelation *friendsRelation;
@property (strong, nonatomic) NSArray *friends;

- (void)getDataFromParse;

@end
