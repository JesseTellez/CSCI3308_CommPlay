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

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ///Bring Lables and images in front of background
    [[_usernameTextLabel superview]bringSubviewToFront:_usernameTextLabel];
    [[_profilePicImage superview]bringSubviewToFront:_profilePicImage];
    [[_userLocationTextLabel superview]bringSubviewToFront:_userLocationTextLabel];
    
    ///Initialize labels and pictures user backend information
    PFUser *user = [PFUser currentUser];
    NSString *location = user[@"homeTown"];
    self.userLocationTextLabel.text = location;
    self.usernameTextLabel.text = user.username;
    self.profilePicImage.layer.masksToBounds = YES;
    
}

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

- (IBAction)addPictureTapped:(id)sender
{
    [self showPhotosLibrary];
    
    ///Create a PFObject to with Picture information
    PFObject *ProfilePicture = [PFObject objectWithClassName:@"Profile_Picture"];
    ///Save the Data to Parse
    NSData *pictureData = UIImagePNGRepresentation(self.profilePicImage.image);
    NSString *fileName = [NSString stringWithFormat:@"%@.png", _usernameTextLabel.text];
    PFFile *imageFile = [PFFile fileWithName:fileName data:pictureData];
    
    [ProfilePicture setObject:imageFile forKey:@"imageFile"];
    [ProfilePicture saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if (error)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"An Error has Occured" message:@"Try uploading your photo again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaInfo = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaInfo isEqualToString:(NSString *)kUTTypeImage])
    {
        ///Photo was taken/selected
        self.profilePicImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (self.imagePicker.sourceType == UIImagePickerControllerSourceTypeCamera)
        {
            ///Save the image
            UIImageWriteToSavedPhotosAlbum(self.profilePicImage.image, nil, nil, nil);
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helper Methods

//- (void)uploadMessage {
//    NSData *fileData;
//    NSString *fileName;
//    NSString*fileType;
//    
//    if (self.profilePicImage.image != nil) {
//        UIImage *newImage;
//        fileData = UIImagePNGRepresentation(newImage);
//        fileName = @"%@.png";
//        fileType =@"image";
//    }
//    else {
//        
//        UIImage *newimage = [[UIImage alloc]initWithContentsOfFile:@"headImage.png"];
//        self.profilePicImage.image = newimage;
//    }
//    
//    PFFile *file = [PFFile fileWithName:fileName data:fileData];
//    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (error) {
//            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"An Error has Occured" message:@"Try sending your Message again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alertView show];
//        }
//        else {
//            PFObject *Picture = [PFObject objectWithClassName:@"ProfilePicture"];
//            [Picture setObject:file forKey:@"file"];
//            [Picture setObject:fileType forKey:@"fileType"];
//            [Picture setObject:[[PFUser currentUser]objectId] forKey:@"OwnerID"];
//            [Picture setObject:[[PFUser currentUser]username] forKey:@"UserName"];
//            [Picture saveInBackground];
//        }
//    }];
//}

@end
