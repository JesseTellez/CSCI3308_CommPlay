//
//  userAboutMe.h
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface userAboutMe : NSObject

- (id)initWithPFObject:(PFObject *)object;

@property (strong, nonatomic) PFObject *object;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *aboutMeText;
@property (strong, nonatomic) NSString *ownerId;

@end
