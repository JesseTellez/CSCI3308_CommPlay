//
//  FirstViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "LobbyViewController.h"


@interface LobbyViewController ()

@end

@implementation LobbyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser)
    {
        NSLog(@"Current User: %@", currentUser.username);
    }
    else
    {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
}

-(void)getInvitesFromParse
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (IBAction)logOut:(id)sender
{
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showLogin"])
    {
        LoginViewController *lvc =segue.destinationViewController;
        [lvc setHidesBottomBarWhenPushed:YES];
        lvc.navigationItem.hidesBackButton = YES;
    }
}

@end
