//
//  LoginViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
/*! The Login action checks the login fields to see if information was entered correctly.  If
 the current user exists, then retrienve their information from the database and connect to
 Parse*/
- (IBAction)login:(id)sender;

@end
