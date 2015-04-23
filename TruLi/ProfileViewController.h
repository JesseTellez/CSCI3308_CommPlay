//
//  ProfileViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 3/31/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SignupViewController.h"

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePicker;
/*!properties of a user */
@property (weak, nonatomic) IBOutlet UILabel *usernameTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocationTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImage;
@property (weak, nonatomic) IBOutlet UILabel *gamesPlayedTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *userHonorsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *backgroundView;
/*!addPicture checks the state of the button.  If the button is tapped, the user can choose a photo from their album as a profile picture */
- (IBAction)addPictureTapped:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;

@end

