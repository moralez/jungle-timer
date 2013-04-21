//
//  SummonersRiftViewController.m
//  jungle-timer
//
//  Created by Johnny Moralez on 4/20/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "SummonersRiftViewController.h"
#import "JungleTimerCell.h"
#import "AppPreferences.h"
#import <AudioToolbox/AudioToolbox.h>

#define kBlueSideBlueBuffId     @"blue-ancient-golem"
#define kPurpleSideBlueBuffId   @"purple-ancient-golem"
#define kBlueSideRedBuffId      @"blue-lizard-elder"
#define kPurpleSideRedBuffId    @"purple-lizard-elder"
#define kDragonId               @"dragon"
#define kBaronNashorId          @"baron-nashor"

#define kBuffRespawnTime        300
#define kDragonRespawnTime      360
#define kBaronRespawnTime       420

#define kJungleTimerCell        @"JungleTimerCell"

@interface SummonersRiftViewController () {
    NSMutableArray  *buttons;
    NSDictionary    *buttonInfo;
}

@end

@implementation SummonersRiftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        buttons = [NSMutableArray arrayWithArray: @[kBlueSideBlueBuffId, kBlueSideRedBuffId, kPurpleSideBlueBuffId, kPurpleSideRedBuffId, kDragonId, kBaronNashorId]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    buttons = [NSMutableArray arrayWithArray: @[kBlueSideBlueBuffId, kBlueSideRedBuffId, kPurpleSideBlueBuffId, kPurpleSideRedBuffId, kDragonId, kBaronNashorId]];
    buttonInfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:kBuffRespawnTime], kBlueSideBlueBuffId,
                                                                   [NSNumber numberWithInt:kBuffRespawnTime], kBlueSideRedBuffId,
                                                                   [NSNumber numberWithInt:kBuffRespawnTime], kPurpleSideBlueBuffId,
                                                                   [NSNumber numberWithInt:kBuffRespawnTime], kPurpleSideRedBuffId,
                                                                   [NSNumber numberWithInt:kDragonRespawnTime], kDragonId,
                                                                   [NSNumber numberWithInt:kBaronRespawnTime],  kBaronNashorId, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionViewController Data Source Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [buttons count];
}

- (JungleTimerCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JungleTimerCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJungleTimerCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[JungleTimerCell alloc] init];
    }
    
    NSString *cellId = [buttons objectAtIndex:[indexPath row]];
    NSNumber *respawnTime = [buttonInfo objectForKey:cellId];
    [[cell button] setBackgroundImage:[UIImage imageNamed:cellId] forState:UIControlStateNormal];
    [[cell button] setupButtonWithId:cellId
                         respawnTime:[respawnTime doubleValue]
                         andDelegate:self];
    
    return cell;
}

#pragma mark UICollectionViewController Delegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Did Select Item");
}

#pragma mark JungleTimerDelegate Methods

- (void)timerFired:(JungleTimerButton *)button {
    if ([AppPreferences shouldVibrate]) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

@end
