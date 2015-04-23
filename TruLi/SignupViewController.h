//
//  SignupViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignupViewController : UIViewController
/*!properties to send to parse and create a new user in the database */
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *homeTown;
/*! The Signup action takes the userinput and stores the information as strings.  If the user doesnt not enter information, this creates an alert.  If information is entered, the information is sent and stored in the database*/
- (IBAction)Signup:(id)sender;

@end
