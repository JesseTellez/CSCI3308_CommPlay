//
//  friendRequest.h
//  TruLi
//
//  Created by Jesse Tellez on 4/18/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <ParseUI/ParseUI.h>

@interface friendRequest : PFQueryTableViewController <UIAlertViewDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic)NSMutableArray *friends;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *userActivity;
@property (strong, nonatomic)PFObject *currentFriendRequest;
@property (strong, nonatomic)NSMutableArray *friendRequests;
@property (strong, nonatomic)NSMutableArray *searchResults;
@property (strong, nonatomic)NSMutableArray *acceptedRequests;
@property (strong, nonatomic)PFUser *userToFriend;
@property (weak, nonatomic) IBOutlet UISearchController *seachController;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

@end
