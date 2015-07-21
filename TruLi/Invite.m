//
//  Invite.m
//  TruLi
//
//  Created by Jesse Tellez on 6/7/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "Invite.h"

@implementation Invite

- (id)initWithPFObject:(id)object

{
    self = [super init];
    if (self)
    {
        self.fromUser = [object objectForKey:@"from"];
        self.toUser = [object objectForKey:@"to"];
        self.Status = [object objectForKey:@"status"];
        self.object = object;
    }
    return self;
}

@end
