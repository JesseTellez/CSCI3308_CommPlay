//
//  InvitesTableViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 7/9/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "InvitesTableViewController.h"

@interface InvitesTableViewController ()

@end

@implementation InvitesTableViewController
{
    PFUser *currentUser;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentUser = [PFUser currentUser];
    [self PFRetrieveInvites];
}


#pragma mark - Helper Methods

-(void)PFRetrieveInvites
{
    PFQuery *invitesQuery = [PFQuery queryWithClassName:@"Invites"];
    
    [invitesQuery whereKey:@"toUser" equalTo:currentUser.username];
    [invitesQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            self.invitesArray = [NSMutableArray arrayWithArray:objects];
            [self.tableView reloadData];
//            for (PFObject *object in objects) {
//                
//            }
        }
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}


-(NSString *)getCurrentTimeStamp
{
    NSDateFormatter *objDateFormat = [[NSDateFormatter alloc]init];
    [objDateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *strTime = [objDateFormat stringFromDate:[NSDate date]];
    NSString *strUTCTime = [self GetUTCDateTimeFromLocalTime:strTime];
    
    NSDate *objUTCDate = [objDateFormat dateFromString:strUTCTime];
    long long milliseconds = (long long)([objUTCDate timeIntervalSince1970] * 1000.0);
    
    NSString *strTimeStamp = [NSString stringWithFormat:@"%lld", milliseconds];
    
    return strTimeStamp;
}

-(NSString *)GetUTCDateTimeFromLocalTime:(NSString *)IN_strLocalTime
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    
    [dateFormater setDateFormat:@"yyyy-MM-dd"];
    NSDate *objDate = [dateFormater dateFromString:IN_strLocalTime];
    [dateFormater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSString *strDateTime = [dateFormater stringFromDate:objDate];
    
    return strDateTime;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.invitesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"inviteCell";
    
    
    InviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    PFObject *invite = [self.invitesArray objectAtIndex:indexPath.row];
    
    if (!cell)
    {
        cell = [[InviteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.senderName.text = invite[@"fromUser"];
    cell.timeLabel.text = [self getCurrentTimeStamp];
    
    //TODO add the IBActions for the accept and Decline Functions
    
    return cell;

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         //Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
         //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
@end
