//
//  PreferencesViewController.m
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "PreferencesViewController.h"
#import "AppPreferences.h"

@interface PreferencesViewController ()

- (IBAction)toggleShowMinutesAndSeconds:(id)sender;
- (IBAction)toggleVibrate:(id)sender;

@end

@implementation PreferencesViewController

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
	// Do any additional setup after loading the view.
    
    [self.minutesAndSecondsButton setSelected:[AppPreferences showMinutesAndSeconds]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleShowMinutesAndSeconds:(id)sender {
    [self.minutesAndSecondsButton setSelected:!self.minutesAndSecondsButton.selected];
    [AppPreferences setShowMinutesAndSeconds:self.minutesAndSecondsButton.selected];
}

- (IBAction)toggleVibrate:(id)sender {
    [self.vibrateButton setSelected:!self.vibrateButton.selected];
    [AppPreferences setVibrate:self.vibrateButton.selected];
}

@end
