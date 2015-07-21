//
//  ProfileViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 3/31/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "ProfileViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ProfileViewController ()
{
    PFObject *previousUserPhoto;
    
}

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentUser = [PFUser currentUser];
    [self customizeView];
    [self loadDataFromParse];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    //there is a bug here that doesnt update the image real-time
    [super viewDidAppear:animated];
    [self loadAboutMeDataFromParse];
}

- (IBAction)addPictureTapped:(id)sender
{
    [self showPhotosLibrary];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //if a new picture is choosen remove all other pictures associated to the user
    PFUser *user = [PFUser currentUser];
    NSString *mediaInfo = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaInfo isEqualToString:(NSString *)kUTTypeImage])
    {
        ///Photo was taken/selected
        self.profilePicImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSData *pictureData = UIImagePNGRepresentation(self.profilePicImage.image);
        NSString *fileName = [NSString stringWithFormat:@"%@.png", @"random"];
        PFFile *imageFile = [PFFile fileWithName:fileName data:pictureData];
        [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
             if (error)
             {
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"An Error has Occured" message:@"Try uploading your photo again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 [alertView show];
             }
             else
             {
                 //delete the other pictures associated with the user
//                 if (previousUserPhoto) {
//                     [previousUserPhoto deleteInBackground];
//                     NSLog(@"A previous file has been deleted");
//                 }
                 [user setObject:imageFile forKey:@"User_Photo"];
                 //PFObject *ProfilePicture = [PFObject objectWithClassName:@"Profile_Picture"];
                 //[ProfilePicture setObject:imageFile forKey:@"imageFile"];
                 //ProfilePicture[@"pictureOwner"] = self.currentUser.objectId;
                 //self.currentUserImages = ProfilePicture;
                 [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                     if (error) {
                         NSLog(@"Error: %@ %@", error, [error userInfo]);
                     }
                 }];
             }
         }];
        if (self.imagePicker.sourceType == UIImagePickerControllerSourceTypeCamera)
        {
            ///Save the image
            UIImageWriteToSavedPhotosAlbum(self.profilePicImage.image, nil, nil, nil);
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showAddBio"]) {
        //TODO: MAKE THIS WORK
    }
}

#pragma mark - Helper Methods

- (void)showPhotosLibrary
{
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = NO;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    [self presentViewController:self.imagePicker animated:NO completion:nil];
}


- (void)customizeView
{
    //general
    NSString *location = self.currentUser[@"homeTown"];
    self.userLocationTextLabel.text = location;
    self.usernameTextLabel.text = self.currentUser.username;
    [[_usernameTextLabel superview]bringSubviewToFront:_usernameTextLabel];
    [[_profilePicImage superview]bringSubviewToFront:_profilePicImage];
    [[_userLocationTextLabel superview]bringSubviewToFront:_userLocationTextLabel];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //image view customizations
    self.profilePicImage.contentMode = UIViewContentModeScaleAspectFill;
    self.profilePicImage.layer.borderWidth = 5.0f;

    self.profilePicImage.layer.borderColor = [[UIColor colorWithRed:14.0/255.0 green:227.0/255.0 blue:193.0/255.0 alpha:1.0] CGColor];
    self.profilePicImage.layer.masksToBounds = YES;
    self.profilePicImage.layer.cornerRadius = 30.0f;
    self.profilePicImage.clipsToBounds = YES;
    
    //background image
    self.backGroundImageView.layer.masksToBounds = NO;
    self.backGroundImageView.layer.borderWidth = 5.0f;
    self.backGroundImageView.layer.borderColor = [[UIColor colorWithRed:255.0/255.0 green:99.0/255.0 blue:121.0/255.0 alpha:1.0] CGColor];
    self.backGroundImageView.layer.cornerRadius = 130.0;
    self.backGroundImageView.clipsToBounds = YES;
}

- (void)loadDataFromParse
{
//    if (self.currentUser)
//    {
//        PFQuery *pictureQuery = [PFUser query];
//        //PFQuery *PictureQuery = [PFQuery queryWithClassName:@"Profile_Picture"];
//        //[pictureQuery whereKey:@"objectID" equalTo:self.currentUser.objectId];
//        //[pictureQuery orderByDescending:@"createdAt"];
//        
//        [pictureQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//            currentPhoto = object;
//            //swicth this with image file if this doesnt work
//            PFFile *image = [currentPhoto objectForKey:@"User_Photo"];
//            //previousUserPhoto = image;
//            
//            if (image == nil)
//            {
//                self.profilePicImage.image = [UIImage imageNamed:@"headImage.png"];
//            }
//            else
//            {
//                [image getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
//                {
//                    self.profileImage = [UIImage imageWithData:data];
//                    self.profilePicImage.image = self.profileImage;
//
//                }];
//            }
//        }];
//    }
    //previousUserPhoto = [self.currentUser objectForKey:@"User_Photo"];
    PFFile *imageFile = [self.currentUser objectForKey:@"User_Photo"];
    if (imageFile == nil) {
        self.profilePicImage.image = [UIImage imageNamed:@"headImage.png"];
    }
    else
    {
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            self.profileImage = [UIImage imageWithData:data];
            self.profilePicImage.image = self.profileImage;
        }];
    }
}

- (void)loadAboutMeDataFromParse
{
    if (self.currentUser)
    {
        PFQuery *aboutMeQuery = [PFQuery queryWithClassName:@"aboutMe"];
        //aboutMeQuery.cachePolicy = kPFCachePolicyCacheThenNetwork;
        [aboutMeQuery whereKey:@"ownerId" equalTo:self.currentUser.objectId];
        [aboutMeQuery orderByDescending:@"createdAt"];
    
        [aboutMeQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            PFObject *currentAboutMe = object;
            NSString *AboutMe = [currentAboutMe objectForKey:@"aboutMeText"];
            if ([AboutMe length] != 0)
            {
                self.aboutMeTextView.text = AboutMe;
            }
            else
            {
                self.aboutMeTextView.text = @"No information entered";
            }
        }];
    }
}

@end
