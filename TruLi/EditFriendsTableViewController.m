//
//  EditFriendsTableViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 3/31/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "EditFriendsTableViewController.h"
#import "FindFreindsTableViewCell.h"

@interface EditFriendsTableViewController ()

@end

@implementation EditFriendsTableViewController {
    BOOL stopFetching;
    BOOL requestInProgress;
    ProfilePicture *userImage;
    NSArray *PicturesArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentUser = [PFUser currentUser];
    
    //find all users
    [self getDataFromParse];
    //[self fetchData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allUsers.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    FindFreindsTableViewCell *cell = (FindFreindsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[FindFreindsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.contentView.layer.cornerRadius = 40;
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
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
    if ([self isFriend:user])
    {
        ///add checkmark
        if ([self.friends containsObject:user.objectId])
        {
            
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    else
    {
        ///clear checkmark
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ///add users
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    ///update the backend to add friends
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    
    if ([self isFriend:user])
    {
        ///1. remove check mark
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        ///2. remove from array with friends
        for (PFUser *friend in self.friends)
        {
            if ([friend.objectId isEqualToString:user.objectId])
            {
                [self.friends removeObject:friend];
                break;
            }
        }
        ///3. remove from backend
        [friendsRelation removeObject:user];
        
    }
    else
    {
        ///add as friend
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.friends addObject:user];
        [friendsRelation addObject:user];
    }
    
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if (error)
        {
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
    }];
    
}

#pragma mark - Helper Methods
- (void)TableCellConfig
{
    
}
- (void)getDataFromParse
{
    PFQuery *query = [PFUser query];
    
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (error)
         {
             NSLog(@"Error: %@ %@", error, [error userInfo]);
         }
         else
         {
             ///add a propertie to hold on to the array of objects
             self.allUsers = objects;
             [self.tableView reloadData];
         }
     }];

}

- (BOOL)isFriend:(PFUser *)user
{
    for (PFUser *friend in self.friends)
    {
        if ([friend.objectId isEqualToString:user.objectId])
        {
            return YES;
        }
    }
    return NO;
}

@end
