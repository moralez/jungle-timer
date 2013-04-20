//
//  MainViewController.m
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "MainViewController.h"

#define kBlueSideBlueBuffId     @"Blue Side Blue Buff"
#define kPurpleSideBlueBuffId   @"Purple Side Blue Buff"
#define kBlueSideRedBuffId      @"Blue Side Red Buff"
#define kPurpleSideRedBuffId    @"Purple Side Red Buff"
#define kDragonId               @"Dragon"
#define kBaronNashorId          @"Baron Nashor"

#define kBlueRespawnTime        300
#define kRedRespawnTime         300
#define kDragonRespawnTime      360
#define kBaronRespawnTime       420

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.blueBlueBuffButton setupButtonWithId:kBlueSideBlueBuffId
                                   respawnTime:kBlueRespawnTime
                                   andDelegate:self];
    
    [self.purpleBlueBuffButton setupButtonWithId:kPurpleSideBlueBuffId
                                     respawnTime:kBlueRespawnTime
                                     andDelegate:self];
    
    [self.blueRedBuffButton setupButtonWithId:kBlueSideRedBuffId
                                  respawnTime:kRedRespawnTime
                                  andDelegate:self];
    
    [self.purpleRedBuffButton setupButtonWithId:kPurpleSideRedBuffId
                                    respawnTime:kRedRespawnTime
                                    andDelegate:self];
    
    [self.dragonButton setupButtonWithId:kDragonId
                             respawnTime:kDragonRespawnTime
                             andDelegate:self];
    
    [self.baronButton setupButtonWithId:kBaronNashorId
                            respawnTime:kBaronRespawnTime
                            andDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

#pragma mark JungleTimerButton Delegate Methods

- (void)timerFired:(JungleTimerButton *)button {
    NSLog(@"Timer fired!");
}

@end
