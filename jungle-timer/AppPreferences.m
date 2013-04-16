//
//  AppPreferences.m
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "AppPreferences.h"

@implementation AppPreferences

+ (BOOL)showMinutesAndSeconds {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowMinutesAndSeconds];
}

+ (void)setShowMinutesAndSeconds:(BOOL)show {
    [[NSUserDefaults standardUserDefaults] setBool:show forKey:kShowMinutesAndSeconds];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
