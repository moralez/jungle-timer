//
//  JungleTimerButton.h
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JungleTimerButton;

@protocol JungleTimerDelegate <NSObject>

- (void)timerFired:(JungleTimerButton*)button;

@end

@interface JungleTimerButton : UIButton

@property (nonatomic, assign) NSTimeInterval respawnTime;
@property (nonatomic, strong) id<JungleTimerDelegate> delegate;
@property (nonatomic, assign) NSString *buttonId;

- (void)toggleTimer;
- (void)setupButtonWithId:(NSString*)buttonId
              respawnTime:(NSTimeInterval)respawn
              andDelegate:(id<JungleTimerDelegate>)del;

@end
