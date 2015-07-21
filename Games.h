//
//  Games.h
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Games : NSObject

- (id)initWithPFObject:(PFObject *)object;
//+(BOOL)SaveInBackgroundSuccess:(PFObject*)object;

@property (strong, nonatomic)PFObject *object;

//@property (strong, nonatomic)NSString *winner;

@property (strong, nonatomic)NSString *gameStillActive;
@property (strong, nonatomic) NSNumber *playerLimit;

@property (nonatomic, strong) NSNumber *cardsPlayed;//cards that have been played can't be played again
@property (strong, nonatomic) NSNumber *playersDeck;

//use these to track players
@property (nonatomic, strong) NSMutableArray *idlePlayers;
@property (strong, nonatomic) NSMutableArray *activePlayers;

//Identify the player's turn in the game
@property (strong, nonatomic) NSString *turnID;
@property (nonatomic, strong)NSString *gameID;

@end
