//
//  CardsTableViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 4/7/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AddCardViewController.h"

@interface CardsTableViewController : UITableViewController
/*!properties to store the data from parse into an array to associate the data
 with the current user */
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSArray *userCards;
@property (strong, nonatomic) NSMutableArray *allCards;
/*! The loadDataFromParse method retrienves the information from the database and
 stores the data as objects into an array and a mutablearray to enable features such as delete
 and add*/
-(void)loadDataFromParse;
- (BOOL)isCardOwner:(PFUser *)user;

@end
