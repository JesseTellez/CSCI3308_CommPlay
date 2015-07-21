//
//  UserCard.m
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "UserCard.h"

@implementation UserCard

- (id)initWithPFObject:(PFObject *)object
{
    self = [super init];
    if (self)
    {
        self.cardText = [object objectForKey:@"text"];
        self.cardOwnerID = [object objectForKey:@"CardOwner"];
        self.Truth = [object objectForKey:@"Truth"];
        self.object = object;
    }
    return self;
}

@end
