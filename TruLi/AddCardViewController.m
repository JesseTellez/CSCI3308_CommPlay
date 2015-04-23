//
//  AddCardViewController.m
//  TruLi
//
//  Created by Jesse Tellez on 4/7/15.
//  Copyright (c) 2015 CSCI3308. All rights reserved.
//

#import "AddCardViewController.h"

@interface AddCardViewController ()

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ///Customize Text Feild
    CALayer *imageLayer = _createNewCardText.layer;
    [imageLayer setCornerRadius:10];
    [imageLayer setBorderWidth:1];
    imageLayer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.instructonalLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.instructonalLabel.numberOfLines = 0;
    
    ///Add and customize the checkmark button images
    self.isTruthCard = [[UIButton alloc]initWithFrame:CGRectMake(140, 400 , 100, 100)];
    [self.isTruthCard setBackgroundImage:[UIImage imageNamed:@"checkmark3.png"] forState:UIControlStateNormal];
    [self.isTruthCard setBackgroundImage:[UIImage imageNamed:@"checkmark1.png"] forState:UIControlStateSelected|UIControlStateHighlighted];
    [self.isTruthCard setBackgroundImage:[UIImage imageNamed:@"checkmark1.png"] forState:UIControlStateHighlighted];
    self.isTruthCard.adjustsImageWhenHighlighted = YES;
    [self.isTruthCard addTarget:self action:@selector(TruthButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_isTruthCard];
}

/*The AddCardToArray Method adds creates an instance of PFObject and adds the userinput to the
 Parse Backend */
- (IBAction)addCardToArray:(id)sender
{
    
    PFUser *user = [PFUser currentUser];
    NSString *cardInfo = [self.createNewCardText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    ///Make a new playercard when the button is pressed and add it to Parse
    PFObject *newPlayerCard = [PFObject objectWithClassName:@"userCard"];
    [self.userCards addObject:newPlayerCard];
    newPlayerCard[@"text"] = cardInfo;
    newPlayerCard[@"CardOwner"] = user;
    
    if ((self.isTruthCard.state == UIControlStateHighlighted) || (self.isTruthCard.state == UIControlStateSelected))
    {
        ///Card is True, save to backend
        newPlayerCard[@"Truth"]= @"true";
        [newPlayerCard saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
        {
            if (succeeded)
            {
                UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Saved" message:@"Your card has successfully been saved!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertview show];
            }
            else
            {
                NSLog(@"Error %@ %@", error, [error userInfo]);
            }
        }];
    }
    else
    {
        ///Card is False, save to backend
        newPlayerCard[@"Truth"] = @"false";
        [newPlayerCard saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
            if (succeeded)
            {
                UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Saved" message:@"Your card has successfully been saved!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertview show];
            }
            else
            {
                NSLog(@"Error %@ %@", error, [error userInfo]);
            }
        }];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ///Send the user back to the cardsView tab once a card is created
    if ([segue.identifier isEqualToString:@"backToCardsView"])
    {
        CardsTableViewController *lvc =segue.destinationViewController;
        lvc.navigationItem.hidesBackButton = YES;
    }
}
/* CheckBoxIsSelected: checks and initializes the state of the check box */
- (void)checkBoxIsSelected:(id)sender
{
    ///Hold Stateof the checkbox
    checkBoxSelected = !checkBoxSelected;
    [self.isTruthCard setSelected:checkBoxSelected];
}

- (IBAction)TruthButtonPushed:(id)sender
{
    [self performSelector:@selector(setSelectedTruthYes:) withObject:sender afterDelay:0];
}

- (void)setSelectedTruthYes:(UIButton *)sender
{
    [sender setHighlighted:YES];
}
@end
