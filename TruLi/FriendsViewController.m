//
//  FriendsViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "FriendsViewController.h"

@interface FriendsViewController (){
    NSArray *Users;
}

@end

@implementation FriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getDataFromParse];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showEditFriends"])
    {
        EditFriendsTableViewController *viewController = (EditFriendsTableViewController *)segue.destinationViewController;
        viewController.friends = [NSMutableArray arrayWithArray:self.friends];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.friends count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    FindFreindsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    
    if (!cell)
    {
        cell = [[FindFreindsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFFile *image = [user objectForKey:@"User_Photo"];
    if (image == nil) {
        cell.FindFriendsProfilePic.image = [UIImage imageNamed:@"headImage.png"];
    }
    else {
        [image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            cell.FindFriendsProfilePic.image = [UIImage imageWithData:data];
        }];
    }
    cell.findFriendsUsername.text = user.username;
    cell.findFriendsUserBio.text = user[@"homeTown"];
    
    return cell;
}

#pragma mark - Helper Methods

- (void)getDataFromParse
{
    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (error)
         {
             NSLog(@"Error %@ %@",error, [error userInfo]);
         }
         else
         {
             NSLog(@"%@",objects);
             self.friends = objects;
             [self.tableView reloadData];
         }
     }];
}

- (void)getUserData
{
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        Users = objects;
    }];
}

@end
