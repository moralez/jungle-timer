//
//  MainViewController.h
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "FlipsideViewController.h"
#import "JungleTimerButton.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, JungleTimerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) IBOutlet JungleTimerButton *blueBlueBuffButton;
@property (strong, nonatomic) IBOutlet JungleTimerButton *purpleBlueBuffButton;

@property (strong, nonatomic) IBOutlet JungleTimerButton *blueRedBuffButton;
@property (strong, nonatomic) IBOutlet JungleTimerButton *purpleRedBuffButton;

@property (strong, nonatomic) IBOutlet JungleTimerButton *dragonButton;
@property (strong, nonatomic) IBOutlet JungleTimerButton *baronButton;

@end
