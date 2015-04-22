//
//  friendRequest.m
//  TruLi
//
//  Created by Jesse Tellez on 4/18/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "friendRequest.h"

#define kAlertTagSendRequest 1
#define kAlertTagHandleRequest 2
#define kAlertTagAcceptedRequest 3

@implementation friendRequest

//- (void)viewDidLoad {
//    
//    _friends = [[NSMutableArray alloc] init];
//    _friendRequests = [[NSMutableArray alloc] init];
//    _searchResults = [[NSMutableArray alloc] init];
//    _acceptedRequests = [[NSMutableArray alloc] init];
//    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//    self.tableView.tableHeaderView = _searchBar;
//    CGPoint offset = CGPointMake(0, _searchBar.frame.size.height);
//    self.tableView.contentOffset = offset;
//    
//    self.refreshControl = [[UIRefreshControl alloc]init];
//    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
//    
//    _userActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    _userActivity.center = self.view.center;
//    [self.view addSubview:_userActivity];
//    
//    [self refreshFriends];
//    
//}
//
//- (void)refresh:(UIRefreshControl *)sender {
//    [self refreshFriends];
//    [sender endRefreshing];
//}
//
//- (void)refreshFriends {
//    [_userActivity startAnimating];
//    [_acceptedRequests removeAllObjects];
//    PFQuery *friendsQuery = [self queryForFriends];
//    PFQuery *acceptedRequestQuery = [self queryForAcceptedFriendRequests];
//    PFQuery *friendRequestsQuery = [self queryForRequests];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        
//        // Find friends
//        NSArray *objects = [friendsQuery fin
//        for (PFObject * obj in objects) {
//            [[@"user1"] fetchIfNeeded];
//            [obj[@"user2"] fetchIfNeeded];
//        }
//        _friends = [objects mutableCopy];
//        
//        // Find pending requests
//        objects = [friendRequestsQuery findObjects];
//        for (PFObject *obj in objects) {
//            [obj[@"fromUser"] fetchIfNeeded];
//        }
//        _friendRequests = [objects mutableCopy];
//        
//        // Find accepted requests
//        objects = [acceptedRequestQuery findObjects];
//        for (PFObject *obj in objects) {
//            PFUser *to = (PFUser*)[obj[@"toUser"] fetchIfNeeded];
//            [obj deleteEventually];
//            [_acceptedRequests addObject:to[@"username"]];
//        }
//        
//        // show accepted requests
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [_userActivity stopAnimating];
//            [self.tableView reloadData];
//            if (_acceptedRequests.count > 0) {
//                NSString *friends = _acceptedRequests[0];
//                for (int i = 1; i < _acceptedRequests.count; ++i) {
//                    friends = [friends stringByAppendingFormat:@", %@", _acceptedRequests[i]];
//                }
//                friends = [friends stringByAppendingString:@" accepted your friend request"];
//                
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Friends" message:friends delegate:self cancelButtonTitle:@"Wuhu" otherButtonTitles:nil, nil];
//                alert.tag = kAlertTagAcceptedRequest;
//                [alert show];
//            }
//        });
//    });
//
//}
//
//- (PFQuery *)queryForAcceptedFriendRequests {
//    PFUser *user = [PFUser currentUser];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"status = %@ AND (fromUser = %@ AND toUser != %@)", @"approved", user, user];
//    PFQuery *acceptedRequestQuery = [PFQuery queryWithClassName:@"FriendRequest" predicate:predicate];
//    return acceptedRequestQuery;
//}
//
//- (PFQuery *)queryForFriends {
//    PFUser *user = [PFUser currentUser];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user1 = %@ AND user2 != %@ OR user1 != %@ AND user2 = %@", user, user, user, user];
//    PFQuery *friendsQuery = [PFQuery queryWithClassName:@"Friendship" predicate:predicate];
//    return friendsQuery;
//}
//
//- (PFQuery *)queryForRequests {
//    // Setup the query
//    PFUser *user = [PFUser currentUser];
//    
//    // Find only requests that has a status of 'pending' and where the toUser is the current user and the from user is NOT the current user.
//    // no need to befriend yourself.
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"status = %@ AND (toUser = %@ AND fromUser != %@)", @"pending", user, user];
//    PFQuery *friendRequests = [PFQuery queryWithClassName:@"FriendRequest" predicate:predicate];
//    return friendRequests;
//}



@end
