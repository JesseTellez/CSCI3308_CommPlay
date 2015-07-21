//
//  FindFreindsTableViewCell.m
//  TruLi
//
//  Created by Jesse Tellez on 4/16/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "FindFreindsTableViewCell.h"

@implementation FindFreindsTableViewCell

- (void)awakeFromNib {
   // self.FindFriendsProfilePic = [[PFImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    //self.FindFriendsProfilePic.contentMode = UIViewContentModeScaleAspectFill;
    self.FindFriendsProfilePic.clipsToBounds = YES;
    self.FindFriendsProfilePic.layer.borderWidth = 5.0f;
    self.FindFriendsProfilePic.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.FindFriendsProfilePic.layer.masksToBounds = YES;
    self.FindFriendsProfilePic.layer.cornerRadius = 13.0f;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //CGRect screenRect = [[UIScreen mainScreen]bounds];
        //CGFloat screenWidth = screenRect.size.width;
        //may need to change these values
        self.FindFriendsProfilePic = [[PFImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        
        self.FindFriendsProfilePic.contentMode = UIViewContentModeScaleAspectFill;
        self.FindFriendsProfilePic.clipsToBounds = YES;
        self.FindFriendsProfilePic.layer.borderWidth = 5.0f;
        self.FindFriendsProfilePic.layer.borderColor = [[UIColor whiteColor]CGColor];
        self.FindFriendsProfilePic.layer.masksToBounds = NO;
        self.FindFriendsProfilePic.layer.cornerRadius = 13.0f;
    }
    return self;
}

-(void)setProfileImage:(ProfilePicture *)Picture
{
    //there might be a bug on this line
    //self.FindFriendsProfilePic = Picture.imageFile;
    
    
    PFQuery *pictureQuery = [PFQuery queryWithClassName:@"Profile_Picture"];
    [pictureQuery whereKey:@"pictureOwner" equalTo:Picture.PictureOwner];
    [pictureQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error)
    {
        self.FindFriendsProfilePic.file = object[@"imageFile"];
        [self.FindFriendsProfilePic loadInBackground];
    }];
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected)
    {
        //change backgrond color
    }
    else
    {
        //change background and text color
    }
}

@end
