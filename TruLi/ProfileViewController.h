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
#import "AddBioViewController.h"

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    CGColorRef tealColorRef;
}

@property (strong, nonatomic) UIImagePickerController *imagePicker;


//outlets
@property (strong, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocationTextLabel;
@property (retain, nonatomic) IBOutlet UIImageView *profilePicImage;
@property (weak, nonatomic) IBOutlet UILabel *gamesPlayedTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *userHonorsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *backgroundView;
@property (strong, nonatomic) IBOutlet UITextView *aboutMeTextView;

//data management
@property (strong, nonatomic) NSArray *picturesArray;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) UIImage *profileImage;
@property (strong, nonatomic) NSArray *userAboutMe;

/*!addPicture checks the state of the button.  If the button is tapped, the user can choose a photo from their album as a profile picture */

//instance methods
- (void)loadAboutMeDataFromParse;
- (void)customizeView;
- (IBAction)addPictureTapped:(id)sender;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;


@end

