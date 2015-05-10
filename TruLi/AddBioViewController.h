//
//  AddBioViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 5/8/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ProfileViewController.h"

@interface AddBioViewController : UIViewController

@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) IBOutlet UITextView *enterBioTextView;


- (IBAction)updateButtonPushed:(id)sender;

- (void)configureViewAppearance;

@end
