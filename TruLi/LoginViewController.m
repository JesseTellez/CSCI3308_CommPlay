//
//  LoginViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 3/30/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

/* The Login action checks the login fields to see if information was entered correctly.  If
 the current user exists, then retrienve their information from the database and connect to 
 Parse*/
- (IBAction)login:(id)sender
{
        NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([username length]==0 || [password length]==0)
        {
            UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alertview show];
        }
        else
        {
            ///attempt to login
            [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error)
            {
                if (error)
                {
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry!" message: [error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [alertView show];
                }
                else
                {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }
            }];
        }
}

@end
