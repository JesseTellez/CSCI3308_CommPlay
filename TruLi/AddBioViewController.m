//
//  AddBioViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 5/8/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "AddBioViewController.h"

@interface AddBioViewController ()

@end

@implementation AddBioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureViewAppearance];
    self.currentUser = [PFUser currentUser];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //clear the UITextView
}

- (IBAction)updateButtonPushed:(id)sender
{
    if ([self.enterBioTextView.text length] != 0)
    {
        PFObject *aboutMeObject = [PFObject objectWithClassName:@"aboutMe"];
        [aboutMeObject setObject:self.currentUser.objectId forKey:@"ownerId"];
        [aboutMeObject setObject:[self.currentUser username] forKey:@"username"];
        [aboutMeObject setObject:self.enterBioTextView.text forKey:@"aboutMeText"];
        [aboutMeObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
        {
            if (error)
            {
                NSLog(@"Error: %@ %@",error, [error userInfo]);
            }
        }];
    }
    else
    {
        UIAlertView *alerview = [[UIAlertView alloc]initWithTitle:@"Opps!" message:@"please enter a something about yourself!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerview show];
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"backToProfile"]) {
        ProfileViewController *vc = segue.destinationViewController;
        vc.navigationItem.hidesBackButton = YES;
        [vc performSegueWithIdentifier:@"backToProfile" sender:self];
    }
}

#pragma mark - Helper Methods
- (void)configureViewAppearance
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    CALayer *imageLayer = _enterBioTextView.layer;
    [imageLayer setCornerRadius:10];
    [imageLayer setBorderWidth:5];
    imageLayer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:99.0/255.0 blue:121.0/255.0 alpha:1.0] CGColor];
}

@end
