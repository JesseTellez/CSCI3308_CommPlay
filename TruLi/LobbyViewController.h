//
//  FirstViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LoginViewController.h"

@interface LobbyViewController : UITableViewController

//functions for the menubar
-(void) setMenuBarTitle:(NSString *) menuBarTitle;
-(void) setMenuBarBackground:(UIColor *) color;
-(void) setFadeAmountWithAlpha:(float) alphaVal;
-(void) setFadeTintWithColor:(UIColor *) color;
-(void) dropShapeShouldShowWhenOpen:(BOOL) shouldShow;

//Outlets for menubar
@property (weak, nonatomic)IBOutlet UIView *container;
@property (weak, nonatomic)IBOutlet UIView *menuBar;
@property (weak, nonatomic)IBOutlet UIView *menu;
@property (weak, nonatomic)IBOutlet UIButton *menuButton;
@property (strong, nonatomic)IBOutlet UILabel *titleLabel;
@property (nonatomic)IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, strong)IBOutlet UITapGestureRecognizer *tapRecognizer;

//IBActions for menuBar
-(IBAction)menuButtonAction:(UIButton *)sender;
-(IBAction)listButtonAction:(UIButton *)sender;


- (IBAction)logOut:(id)sender;

-(void)collectAllInvites:(PFObject *)invites;

//TODO query the users invites sent to them by using the invite class on Parse

@end

