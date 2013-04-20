//
//  JungleTimerButton.m
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "JungleTimerButton.h"
#import "AppPreferences.h"

#define kCountdownSelector      countdown
#define kToggleTimerSelector    toggleTimer

@interface JungleTimerButton () {
    int currMinute;
    int currSeconds;
}

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation JungleTimerButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setupButtonWithId:(NSString*)buttonId
              respawnTime:(NSTimeInterval)respawn
              andDelegate:(id<JungleTimerDelegate>)del {
    self.buttonId = buttonId;
    self.respawnTime = respawn;
    self.delegate = del;
    currMinute = self.respawnTime / 60;
    currSeconds = self.respawnTime - (currMinute * 60);
    
    [self addTarget:self
             action:@selector(toggleTimer)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:40.0f]];
    [self.titleLabel setShadowColor:[UIColor blackColor]];
    [self.titleLabel setShadowOffset:CGSizeMake(2.0, 3.0)];
    [self.titleLabel setTextColor:[UIColor whiteColor]];

}

- (void)toggleTimer {
    if ([self.timer isValid]) {
        [self.timer invalidate];
        [self setTitle:@"" forState:UIControlStateNormal];
    } else {
        currMinute = self.respawnTime / 60;
        currSeconds = self.respawnTime - (currMinute * 60);
        [self setCountdownText];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(kCountdownSelector)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)countdown {
    
    if ((currMinute > 0 || currSeconds >= 0) && currMinute >= 0) {
        
        if (currSeconds == 0) {
            currMinute -= 1;
            currSeconds = 59;
        } else if (currSeconds > 0) {
            currSeconds -= 1;
        }
        
        if (currMinute > -1) {
            [self setCountdownText];
        }
    } else {
        [self.timer invalidate];
        if (self.delegate && [self.delegate respondsToSelector:@selector(timerFired:)]) {
            [self.delegate timerFired:self];
        }
        [self setTitle:@"" forState:UIControlStateNormal];
    }
}

- (void)setCountdownText {
    NSString *countdownText = @"";
    int totalSeconds = (currMinute * 60) + currSeconds;
    
    if ([AppPreferences showMinutesAndSeconds]) {
        countdownText = [NSString stringWithFormat:@"%d%@%02d", currMinute, @":", currSeconds];
    } else {
        countdownText = [NSString stringWithFormat:@"%i", totalSeconds];
    }
    
    [self setTitle:countdownText forState:UIControlStateNormal];
    
    CGFloat fontSize = 40.0f;
    
    if (totalSeconds < (self.respawnTime / 3)) {
        fontSize = 60.0f;
    } else if (totalSeconds < (self.respawnTime / 2)) {
        fontSize = 50.0f;
    }
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
}

@end
