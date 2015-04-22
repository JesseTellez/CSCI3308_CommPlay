//
//  CreateGameViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 4/22/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *gameName;
@property (weak, nonatomic) IBOutlet UIStepper *numberOfPlayersIncrement;
@property (weak, nonatomic) IBOutlet UILabel *numberChangingLabel;
@property (weak, nonatomic) IBOutlet UITextView *gameDescriptionTextField;

- (IBAction)playerIncrement:(id)sender;
- (IBAction)createGameButton:(id)sender;

@end
