//
//  CardsTableViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 4/7/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "CardsTableViewController.h"

@interface CardsTableViewController ()

@end

@implementation CardsTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    //When the table appears, load the Data from Parse
    [super viewWillAppear:animated];
    self.currentUser = [PFUser currentUser];
    [self performSelector:@selector(loadDataFromParse)];
}

- (void)loadDataFromParse
{
    //Query Cards from backend
    PFQuery *query = [PFQuery queryWithClassName:@"userCard"];
    [query whereKey:@"CardOwner" equalTo:self.currentUser];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        if (error)
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else
        {
            //Set Arrays to hold the objects returned from the backend
            self.userCards = objects;
            self.allCards = [NSMutableArray arrayWithArray:objects];
            dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            });
        }
    }];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.allCards.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CardsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //Grab a Card from the array and load it to a tableView cell
    PFObject *card = [self.userCards objectAtIndex:indexPath.row];
    NSString *cardInfo = [card objectForKey:@"text"];
    
    //Customize cell properties
    cell.textLabel.text = cardInfo;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Bradley Hand" size:16.0];
    cell.layer.cornerRadius = 10;
    
    
    NSString *cardBool = [card valueForKey:@"Truth"];
    if ([cardBool isEqualToString:@"true"])
    {
        //Highlight Background as Green
        [cell setBackgroundColor:[UIColor colorWithRed:14.0/255.0 green:227.0/255.0 blue:193.0/255.0 alpha:.80]];
    }
    else
    {
        //highlight Background as Red
        [cell setBackgroundColor:[UIColor colorWithRed:207.0/255.0 green:81.0/255.0 blue:81.0/255.0 alpha:.80]];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showAddCard"])
    {
        AddCardViewController *VC = (AddCardViewController *)segue.destinationViewController;
        VC.userCards = [NSMutableArray arrayWithArray:self.allCards];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //When Cell is pulled to the left, delete the cell from the application and the backend
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [tableView beginUpdates];
        PFObject *deletedCard = self.allCards[indexPath.row];
    
        [self.allCards removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: UITableViewRowAnimationFade];
        [deletedCard deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
        {
            [self.tableView reloadData];
            
        }];
        [tableView endUpdates];
    }
}

- (BOOL)isCardOwner:(PFUser *)user
{
        for (PFObject *card in self.userCards)
        {
        if ([[card objectForKey:@"CardOwner"] isEqual:user])
        {
            NSLog(@"This is the card owner");
            return YES;
        }
    }
    return NO;
}


@end
