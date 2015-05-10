//
//  AddCardViewController.h
//  TruLi
//
//  Created by Jesse Tellez on 4/7/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CardsTableViewController.h"
@interface AddCardViewController : UIViewController {
    BOOL checkBoxSelected;
}
/*! Properties to check the state of the card information produced by the user */
@property (strong, nonatomic) NSMutableArray *userCards;
@property (weak, nonatomic) IBOutlet UITextView *createNewCardText;
@property (retain, nonatomic) IBOutlet UIButton *isTruthCard;
@property (weak, nonatomic) IBOutlet UILabel *instructonalLabel;

/*!The AddCardToArray Method adds creates an instance of PFObject and adds the userinput to the
 Parse Backend */
- (IBAction)addCardToArray:(id)sender;
- (void)checkBoxIsSelected:(id)sender;
- (IBAction)TruthButtonPushed:(id)sender;

- (void)setSelectedTruthNo:(UIButton *)sender;
- (void)setSelectedTruthYes:(UIButton *)sender;

@end