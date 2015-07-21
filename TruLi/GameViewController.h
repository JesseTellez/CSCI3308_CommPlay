//
//  GameViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 7/5/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface GameViewController : UIViewController

@property (nonatomic, strong)PFObject *game;
@property (nonatomic, strong)NSNumber *playerLimit;
@property (nonatomic, strong)NSNumber *playerDeck;

//add or remove from this array depending on the state
@property (nonatomic, strong)NSMutableArray *Players;
@property (nonatomic, strong)NSMutableArray *activeInvitesArray;

+(id)initializeWithPlayerId:(NSString *)playerID andWithGameId:(NSString *)gameID andWithTurnId:(NSString *)turnID;

@end
