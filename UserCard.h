//
//  UserCard.h
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface UserCard : NSObject

- (id)initWithPFObject:(PFObject *)object;

@property (strong, nonatomic) NSString *cardText;
@property (strong, nonatomic) PFUser *cardOwnerID;
@property (strong, nonatomic) NSString *Truth;
@property (strong, nonatomic) PFObject *object;

@end
