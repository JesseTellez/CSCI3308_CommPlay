//
//  CreateGameViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 4/22/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "GameViewController.h"

@interface CreateGameViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//properties for game data management
@property (strong, nonatomic)PFObject *gameObject;
@property (strong, nonatomic)NSMutableArray *activeInvites;
@property (strong, nonatomic)NSMutableArray *activeGamesArray;
@property (strong, nonatomic)NSNumber *playerLimit;
@property (strong, nonatomic)NSNumber *playersDeck;
@property (strong, nonatomic)NSString *turnID;
@property (nonatomic, assign)NSString *gameID;
@property (nonatomic, strong)PFObject *invite;


//outlets
@property (weak, nonatomic)IBOutlet UITextField *gameName;
@property (weak, nonatomic)IBOutlet UIStepper *numberOfPlayersIncrement;
@property (weak, nonatomic)IBOutlet UILabel *numberChangingLabel;


@property (strong, nonatomic)NSArray *friendsArray;
@property (strong, nonatomic)NSMutableArray *selectedUsers;



/*!Create game sends the useUITr to the game view screen and inits the game with
 
 he spcified settings */
- (IBAction)playerIncrement:(id)sender;
- (IBAction)createGameButton:(id)sender;

- (void)getFriends;
@end