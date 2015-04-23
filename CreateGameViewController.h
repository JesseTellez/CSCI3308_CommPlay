//
//  CreateGameViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 4/22/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateGameViewController : UIViewController
/*!properties that generate the game instance */
@property (weak, nonatomic) IBOutlet UITextField *gameName;
@property (weak, nonatomic) IBOutlet UIStepper *numberOfPlayersIncrement;
@property (weak, nonatomic) IBOutlet UILabel *numberChangingLabel;
@property (weak, nonatomic) IBOutlet UITextView *gameDescriptionTextField;
/*!Create game sends the user to the game view screen and inits the game with 
 the spcified settings */
- (IBAction)playerIncrement:(id)sender;
- (IBAction)createGameButton:(id)sender;

@end
