//
//  TwistedTreelineViewController.h
//  jungle-timer
//
//  Created by Johnny Moralez on 4/20/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JungleTimerButton.h"

@interface TwistedTreelineViewController : UIViewController <JungleTimerDelegate>

@property (strong, nonatomic) IBOutlet JungleTimerButton *vilemawButton;
@property (strong, nonatomic) IBOutlet JungleTimerButton *leftAltarButton;
@property (strong, nonatomic) IBOutlet JungleTimerButton *rightAltarButton;

@end
