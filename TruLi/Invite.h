//
//  Invite.h
//  TruLi
//
//  Created by Jesse Tellez on 6/7/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Games.h"

@interface Invite : NSObject

-(id)initWithPFObject:(PFObject *)object;

//- (void)SaveObjectInBackground:(PFObject *)object;

@property (strong, nonatomic)PFObject *object;

@property (strong, nonatomic)Games *Game;

@property (strong, nonatomic)PFUser *fromUser;

@property (strong, nonatomic)PFUser *toUser;

@property (strong, nonatomic)NSString *Status;



@end
