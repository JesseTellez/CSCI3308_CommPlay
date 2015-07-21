//
//  userAboutMe.m
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "userAboutMe.h"

@implementation userAboutMe

- (id)initWithPFObject:(PFObject *)object
{
    self = [super init];
    if (self)
    {
        self.aboutMeText = [object objectForKey:@"aboutMeText"];
        self.ownerId = [object objectForKey:@"ownerId"];
        self.username = [object objectForKey:@"username"];
        self.object = object;
    }
    return self;
}

@end
