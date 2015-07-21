//
//  ProfilePicture.m
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "ProfilePicture.h"

@implementation ProfilePicture

- (id)initWithPFObject:(PFObject *)object
{
    self = [super init];
    if (self)
    {
        self.PictureOwner = [object objectForKey:@"pictureOwner"];
        self.imageFile = [object objectForKey:@"imageFile"];
        self.object = object;
    }
    return self;
}

@end
