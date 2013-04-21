//
//  TwistedTreelineViewController.m
//  jungle-timer
//
//  Created by Johnny Moralez on 4/20/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "TwistedTreelineViewController.h"
#import "AppPreferences.h"
#import <AudioToolbox/AudioToolbox.h>

#define kVilemawId      @"Vilemaw"
#define kLeftAltarId    @"Left Altar"
#define kRightAltarId   @"Right Altar"

#define kVilemawRespawnTime     300
#define kLeftAltarRespawnTime   90
#define kRightAlterRespawnTime  90

@interface TwistedTreelineViewController ()

@end

@implementation TwistedTreelineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.vilemawButton setupButtonWithId:kVilemawId
                              respawnTime:kVilemawRespawnTime
                              andDelegate:self];
    
    [self.leftAltarButton setupButtonWithId:kLeftAltarId
                                respawnTime:kLeftAltarRespawnTime
                                andDelegate:self];
    
    [self.rightAltarButton setupButtonWithId:kRightAltarId
                                 respawnTime:kRightAlterRespawnTime
                                 andDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark JungleTimerButton Delegate Methods

- (void)timerFired:(JungleTimerButton *)button {
    if ([AppPreferences shouldVibrate]) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

@end
