//
//  Games.m
//  TruLi
//
//  Created by Jesse Tellez on 5/19/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "Games.h"

@implementation Games


//THIS CLASS IS FOR AN OBJECT THAT IS ALREADY CREATED **NOTICE** THERE IS NO SETOBJECT METHOD
- (id)initWithPFObject:(PFObject *)object
{
    self = [super init];
    if (self)
    {
        self.playersDeck = [object objectForKey:@"cardsInDeck"];
        self.playerLimit = [object objectForKey:@"playerLimit"];
        self.activePlayers = [object objectForKey:@"activePlayers"];
        //self.winner = [object objectForKey:@"winner"];
        self.turnID = [object objectForKey:@"turnID"];
        self.object = object;
    }
    return self;
}



@end
