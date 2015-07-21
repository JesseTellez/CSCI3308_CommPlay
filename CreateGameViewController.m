//
//  CreateGameViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 4/22/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "CreateGameViewController.h"





@implementation CreateGameViewController
{
    IBOutlet UITableView *inviteListTableView;
    PFRelation *friendsRelation;
    BOOL isInvited;
    PFUser *currentUser;
    NSString *gameIdString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];
    if (friendsRelation) {
        [self performSelector:@selector(getFriends)];
    }
    
    //view stuff
    //currentUser = [PFUser currentUser];
    //inviteListTableView = [[UITableView alloc]init];
    //[self.view addSubview:inviteListTableView];
    
    //init Arrays
    self.friendsArray = [[NSArray alloc]init];
    self.selectedUsers = [[NSMutableArray alloc]init];
    self.activeInvites = [[NSMutableArray alloc]init];
    
    //[self numberOfSectionsInTableView:inviteListTableView];
    [self getFriends];
    
    //fetch and store Data
    [self PFGetActiveGames];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)playerIncrement:(id)sender
{
    double value = [(UIStepper *)sender value];
    self.numberOfPlayersIncrement.minimumValue = 2.0;
    self.numberOfPlayersIncrement.maximumValue = 6.0;
    [self.numberChangingLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (IBAction)createGameButton:(id)sender
{
    if ([self.numberChangingLabel.text isEqualToString:@"2"])
    {
        [self createNewGameWithNumberOfPlayers:2];
    }
    else if([self.numberChangingLabel.text isEqualToString:@"3"])
    {
        [self createNewGameWithNumberOfPlayers:3];
    }
    else if([self.numberChangingLabel.text isEqualToString:@"4"])
    {
        [self createNewGameWithNumberOfPlayers:4];
    }
    else if ([self.numberChangingLabel.text isEqualToString:@"5"])
    {
        [self createNewGameWithNumberOfPlayers:5];
    }
    else
    {
        [self createNewGameWithNumberOfPlayers:6];
    }
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //possibly update this in the future to divide sections into friends, recently played, etc.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.friendsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CGcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.friendsArray objectAtIndex:indexPath.row];
    NSLog(@"Number of users found in array: %lu", (unsigned long)self.friendsArray.count);
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell.contentView.layer setBorderColor:[UIColor grayColor].CGColor];
    [cell.contentView.layer setBorderWidth:1.0f];
    cell.textLabel.text = user.username;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    PFUser *user = [self.friendsArray objectAtIndex:indexPath.row];
    
    isInvited = NO;
    if (isInvited == NO)
    {
        if (self.selectedUsers.count <= 20)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            isInvited = YES;
            //this is only IF the other person accepts the invite
            [self.selectedUsers addObject:user];
            [self sendInvite:user];
        }
        else
        {
            UIAlertView *LimitAlertView = [[UIAlertView alloc]initWithTitle:@"Limit Reached" message:@"You can only invite up to 20 players to join your game" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [LimitAlertView show];
        }
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        isInvited = NO;
        [self.selectedUsers removeObject:user];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toGameViewController"])
    {
        GameViewController *gvc = segue.destinationViewController;
        
        [GameViewController initializeWithPlayerId:currentUser.objectId andWithGameId:gameIdString andWithTurnId:currentUser.objectId];
        //set values for the gvc so that the gvc is aware of all the setup
        gvc.game = self.gameObject;
        gvc.playerLimit = self.playerLimit;
        //gvc.playerDeck

        gvc.activeInvitesArray = self.activeInvites;
        
    }
}

#pragma mark - Helper Methods

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"toGameView"])
    {
        BOOL segueShouldOccur = NO;
        if (!segueShouldOccur)
        {
            UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a Game Name and to invite some friends!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alertview show];
            return NO;
        }
    }
    return YES;
}

-(void)PFGetActiveGames
{
    PFQuery *activeGameQuery = [PFQuery queryWithClassName:@"activeGames"];
    
    [activeGameQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        if (!error)
        {
            self.activeGamesArray = [NSMutableArray arrayWithArray:objects];
        }
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)getFriends
{
    PFQuery *query = [friendsRelation query];
    
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
             self.friendsArray = objects;
             [inviteListTableView reloadData];
             
         }
     }];
}

- (void)sendInvite:(PFUser *)user
{
    PFObject *Invites = [PFObject objectWithClassName:@"Invites"];
    
    Invites[@"toUser"] = user.username;
    Invites[@"fromUser"] = [[PFUser currentUser]objectId];
    Invites[@"inviteStatus"] = @"Pending";
    Invites[@"expired"] = @"no";
    
    
    [Invites saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if (!error)
        {
            [self.activeInvites addObject:Invites];
        }
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)createNewGameWithNumberOfPlayers:(int)players
{
    NSString *gameNameS = [self.gameName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([gameNameS length] != 0 && self.activeInvites.count !=0)
    {
        //make a new object within the class Game
        self.gameObject = [PFObject objectWithClassName:@"Game"];
        
        //object set up when game is created
        self.playerLimit = [NSNumber numberWithInt:players];
        self.gameObject[@"PlayerLimit"] = self.playerLimit;
        self.gameObject[@"activePlayers"] = @1;
        self.gameObject[@"gameOwner"] = currentUser.objectId;
        self.gameObject[@"gameActive"] = @"Yes";
        [self.gameObject[@"players"] addObject:currentUser];
        [self createGameIdWithPFObject:self.gameObject];
        
        [self.gameObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
             if (error)
             {
                 NSLog(@"error: %@",error);
             }
             else
             {
                 [self.activeGamesArray addObject:self.gameObject];
                 
                 [currentUser incrementKey:@"gamesCount" byAmount:[NSNumber numberWithInt:1]];
                 [currentUser saveInBackground];
                 [self performSegueWithIdentifier:@"toGameView" sender:self];
             }
         }];
    }
    else
    {
        [self shouldPerformSegueWithIdentifier:@"toGameView" sender:self];
    }
    //[self performSegueWithIdentifier:@"toGameViewController" sender:self];
}

-(NSString *)createGameIdWithPFObject:(PFObject *)gameObject
{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"mm"];
    int minute = [[date stringFromDate:[NSDate date]]intValue];
    [date setDateFormat:@"ss"];
    int seconds = [[date stringFromDate:[NSDate date]]intValue];
    
    int gameID = minute + seconds + (rand() % 1000000);
    gameIdString = [NSString stringWithFormat:@"%d",gameID];
    
    [gameObject setObject:gameIdString forKey:@"gameID"];
    
    return gameIdString;
}

@end