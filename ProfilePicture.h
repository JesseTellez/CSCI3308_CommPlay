//
//  ProfilePicture.h
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface ProfilePicture : NSObject

- (id)initWithPFObject:(PFObject *)object;
//maybe implement a count on user pictures to track into the data base
@property (strong, nonatomic) PFFile *imageFile;
@property (strong, nonatomic) NSString *PictureOwner;
@property (strong, nonatomic) PFObject *object;

@end
